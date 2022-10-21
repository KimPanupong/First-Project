import 'package:covid19/shared/constant.dart';
import 'package:covid19/widgets/Api_StatisticWidget.dart';
import 'package:covid19/widgets/chart/linewidget_day.dart';
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
                    height: 24,
                  ),
                  /*Statistic_Input_Widget(
                    title: "test",*
                  ),*/
                  const ApiWIdget(
                    link1: 'covid19.ddc.moph.go.th',
                    link2: '/api/Cases/today-cases-all',
                    number: 0,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'ข้อมูลวิเคราะห์ 3 เดือนล่าสุด',
                    style: medium.copyWith(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Widget_day(
                    title: '3month',
                    title1: '3 เดือนล่าสุด',
                  ),
                  const SizedBox(
                    height: 80,
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
