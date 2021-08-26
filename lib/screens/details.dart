import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/student.dart';
import '../environment.dart';
import './edit.dart';

class Details extends StatefulWidget {
  final Student? student;

  Details({this.student});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Student'),
          actions: <Widget>[
            IconButton(
              onPressed: () => confirmDelete(context),
              icon: Icon(Icons.remove_circle),
            ),
          ],
        ),
        body: Container(
          height: 300.0,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Name : ${widget.student!.name}",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                "Age : ${widget.student!.age}",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                "Email : ${widget.student!.email}",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                "Phone : ${widget.student!.phone}",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit), onPressed: () => print('onPressed')
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => Edit(student: widget.student),
            //   ),
            ));
  }

  void confirmDelete(BuildContext context) {}
}
