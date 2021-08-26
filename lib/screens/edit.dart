import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/student.dart';
import '../environment.dart';
import '../widgets/appform.dart';

class Edit extends StatefulWidget {
  final Student? student;

  Edit({this.student});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  void initState() {
    nameController = TextEditingController(text: widget.student!.name);
    ageController = TextEditingController(text: widget.student!.age.toString());
    emailController = TextEditingController(text: widget.student!.email);
    phoneController = TextEditingController(text: widget.student!.phone);
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  // properties
  TextEditingController? nameController;
  TextEditingController? ageController;
  TextEditingController? emailController;
  TextEditingController? phoneController;

  Future editStudent() async {
    final url = '${Env.URL_PREFIX}/update.php';
    return await http.post(
      Uri.parse(url),
      body: {
        "id": widget.student!.id.toString(),
        "name": nameController!.text,
        "age": ageController!.text,
        "email": emailController!.text,
        "phone": phoneController!.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            // perintah untuk proses update
            onUpdateConfirm(context);
          },
          child: Text(
            'Update',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              ageController: ageController,
              emailController: emailController,
              phoneController: phoneController,
            ),
          ),
        ),
      ),
    );
  }

  void onUpdateConfirm(context) async {
    await editStudent();
    // redirect
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
