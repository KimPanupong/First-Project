import 'package:covid19/screens/wrapper_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //HomeScreen();
    return MaterialApp(
        title: 'COVID-19',
        theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Colors.green,
        ),
        home: WrapperScreen());
  }
}
