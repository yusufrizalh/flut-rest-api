import 'package:flutter/material.dart';
import '../environment.dart';
import '../widgets/appform.dart';
import 'package:http/http.dart' as http;

class Create extends StatefulWidget {
  final Function? refreshStudentList;

  Create({this.refreshStudentList});

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();
  // properties
  TextEditingController? nameController = new TextEditingController();
  TextEditingController? ageController = new TextEditingController();
  TextEditingController? emailController = new TextEditingController();
  TextEditingController? phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Student'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            // perintah untuk proses create
            if (formKey.currentState!.validate()) {
              onCreateConfirm(context);
            }
          },
          child: Text(
            'Create',
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

  void onCreateConfirm(context) async {
    await createStudent();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  Future createStudent() async {
    final url = '${Env.URL_PREFIX}/create.php';
    return await http.post(
      Uri.parse(url),
      body: {
        "name": nameController!.text,
        "age": ageController!.text,
        "email": emailController!.text,
        "phone": phoneController!.text,
      },
    );
  }
}
