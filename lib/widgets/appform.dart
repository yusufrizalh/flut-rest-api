import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  // properties
  TextEditingController? nameController;
  TextEditingController? ageController;
  TextEditingController? emailController;
  TextEditingController? phoneController;

  AppForm(
      {this.formKey,
      this.nameController,
      this.ageController,
      this.emailController,
      this.phoneController});

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  // validasi
  String? validateName(String value) {
    if (value.length < 6) return 'Nama harus lebih dari 5 karakter.';
    return null;
  }

  String? validateAge(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value)) return 'Usia harus diisi angka.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            // validator: validateName,
          ),
          TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age'),
            // validator: validateAge,
          ),
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: widget.phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Phone'),
          ),
        ],
      ),
    );
  }
}
