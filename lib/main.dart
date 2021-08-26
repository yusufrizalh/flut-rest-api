import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/details.dart';
import './screens/create.dart';
import './screens/edit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST API',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/details': (context) => Details(),
        '/create': (context) => Create(),
        '/edit': (context) => Edit(),
      },
    );
  }
}
