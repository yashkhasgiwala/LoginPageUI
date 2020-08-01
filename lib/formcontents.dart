import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Button.dart';
import 'constant.dart';

class FormContents extends StatefulWidget {
  @override
  _FormContentsState createState() => _FormContentsState();
}

class _FormContentsState extends State<FormContents> {
  final formKey = GlobalKey<FormState>();
  bool abc = false;
  void showpw() {
    setState(() {
      abc = !abc;
    });
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }

  String _email, _password;
  @override
  Widget build(BuildContext context) {
    final double x = MediaQuery.of(context).size.width;
    final double y = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(top: y / 12, left: x / 10, right: x / 10),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: ktextfield,
                  validator: (input) =>
                      !input.contains('@') ? 'Not a valid Email' : null,
                  onSaved: (input) => _email = input,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: ktextfield.copyWith(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: showpw,
                      icon: Icon(
                        abc ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  validator: (input) => input.length < 6
                      ? 'You need at least 6 characters'
                      : null,
                  onSaved: (input) => _password = input,
                  obscureText: abc,
                ),
                SizedBox(height: y / 25),
                Text(
                  "Register | Forgot Password?",
                  style: ksmalltext,
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: _submit,
                  child: Button('Login', Colors.deepOrange),
                ),
                SizedBox(height: 40),
                Text(
                  "Continue with social media",
                  style: ksmalltext,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button('Facebook', Colors.blueAccent),
                    Button('Github', Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
