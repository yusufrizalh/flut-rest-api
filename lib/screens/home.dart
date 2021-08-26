import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/student.dart';
import '../environment.dart';
import './create.dart';
import './details.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Student>>? students; // null safety
  final studentKeyList = GlobalKey<_HomeState>();

  @override
  void initState() {
    super.initState();
    students = getStudentList();
  }

  Future<List<Student>>? getStudentList() async {
    final url = '${Env.URL_PREFIX}/list.php'; // mengirim request
    final response = await http.get(
      // mendapatkan response
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ); // keluaran dalam bentuk json
    // konversi dari json menjadi flutter list
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Student> students = items.map<Student>((json) {
      return Student.fromJson(json);
    }).toList();
    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentKeyList,
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Center(
        child: FutureBuilder<List<Student>>(
          future: students, // nilai konversi json ke list
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      // arahkan ke details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            student: data,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // diarahkan ke form create data student
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return Create();
              },
            ),
          );
        },
      ),
    );
  }
}
