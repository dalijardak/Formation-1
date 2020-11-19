import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  bool isVisible = false;

  void _validate() {
    if (_formKey.currentState.validate()) print("Form Submitted");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 250,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              validator: (value) {
                if (!EmailValidator.validate(value))
                  return "Please Enter a valid email ";
                else
                  return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isVisible,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: isVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              validator: (value) {
                if (value.length < 6)
                  return "Minimum 6 charecters for password ";
                else
                  return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: _validate,
              ),
            )
          ],
        ),
      ),
    );
  }
}
