import 'package:covid19/province/thailand/thaicharts.dart';
import 'package:covid19/shared/constant.dart';
import 'package:covid19/province/thailand/thaistatistic_widget.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/kasus.png',
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 100),
          child: Text(
            'ข้อมูล\nCOVID-19',
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
            height: MediaQuery.of(context).size.height * 0.7,
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
                    'อัพเดทข้อมูลล่าสุด',
                    style: medium.copyWith(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ThaiStatisticWidget(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'ข้อมูลวิเคราะห์',
                    style: medium.copyWith(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                  const thaimount(),
                  const SizedBox(
                    height: 100,
                  ),
                  /* Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),*/
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
