// ignore_for_file: deprecated_member_use

import 'package:covid19/address/splashscreen.dart';
import 'package:covid19/loginscreens/forgotpassword_page.dart';
import 'package:covid19/loginscreens/register.dart';
import 'package:covid19/screens/wrapper_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:covid19/model/profile.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              /*floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                child: Text("Back"),
              ),*/

              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/login1.png"),
                          Text("Email", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Please enter email"),
                              EmailValidator(errorText: "Invalid email format")
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String email) {
                              profile.email = email;
                            },
                          ),
                          /*SizedBox(
                            height: 1,
                          ),*/
                          Text("Password", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please enter your password"),
                            obscureText: true,
                            onSaved: (String password) {
                              profile.password = password;
                            },
                          ),
                          Center(
                              child: ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new SizedBox(
                                width: 150.0,
                                //height: ,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPasswordPage()));
                                  },
                                  color: Colors.red,
                                  child: Text(
                                    'Forgotpassword',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              new SizedBox(
                                width: 150.0,
                                //height: ,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                  color: Colors.orange,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Container(
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.green,
                              child: Text("LOGIN IN",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              onPressed: () async {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: profile.email,
                                            password: profile.password)
                                        .then((value) {
                                      formKey.currentState.reset();
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return WrapperScreen();
                                      }));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    Fluttertoast.showToast(
                                        msg: e.message,
                                        gravity: ToastGravity.CENTER);
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
