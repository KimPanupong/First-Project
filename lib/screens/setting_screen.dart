// ignore_for_file: deprecated_member_use

import 'package:covid19/address/splashscreen.dart';
import 'package:covid19/loginscreens/changepassword_page.dart';

import 'package:covid19/loginscreens/login.dart';
import 'package:covid19/shared/constant.dart';
import 'package:covid19/widgets/item_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Stack(
      children: [
        Image.asset(
          'assets/images/bantuan.png',
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 100),
          child: Text(
            'ตั้งค่า',
            style: bold.copyWith(
              color: white,
              fontSize: 36,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.72,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    '',
                    style: medium.copyWith(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                  ItemWidget(
                    color: green,
                    image: 'mencegah.png',
                    title: 'ติดตามตำแหน่ง',
                    custom: Center(
                      child: RaisedButton(
                        color: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()));
                        },
                        child: Text('GPS', style: regular),
                      ),
                    ),
                  ),
                  ItemWidget(
                    color: green,
                    image: 'mengobati.png',
                    title: 'เปลี่ยนรหัสผ่าน',
                    custom: Center(
                      child: FlatButton(
                        child: Text('เปลี่ยนรหัส', style: regular),
                        color: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordPage()));
                        },
                      ),
                    ),
                  ),
                  ItemWidget(
                    color: green,
                    image: 'mengantisipasi.png',
                    title: 'ออกจากระบบ',
                    custom: Center(
                      child: RaisedButton(
                        child: Text('ออกจากระบบ', style: regular),
                        color: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        onPressed: () {
                          auth.signOut().then((value) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
