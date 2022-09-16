import 'package:covid19/province/north/caseprovinces.dart';
import 'package:covid19/province/north/northstatistic.dart';
import 'package:covid19/shared/constant.dart';
import 'package:covid19/province/widget/location_widget.dart';

import 'package:flutter/material.dart';

import '../province/north/northcharts.dart';

class InformasiScreen extends StatelessWidget {
  const InformasiScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/informasi.png',
        width: MediaQuery.of(context).size.width,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, top: 100),
        child: Text(
          'ข้อมูลสถิติ\nCOVID-19',
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 24,
              ),
              LocationWidget(),
              const SizedBox(
                height: 24,
              ),
              const NorthStatisticWidget(),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'วิเคราะห์ข้อมูลรายวัน',
                style: medium.copyWith(
                  color: black,
                  fontSize: 20,
                ),
              ),
              const northmonth(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'วิเคราะห์ข้อมูลรายสัปดาห์',
                style: medium.copyWith(
                  color: black,
                  fontSize: 20,
                ),
              ),
              const northmonth(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'วิเคราะห์ข้อมูลรายเดือน',
                style: medium.copyWith(
                  color: black,
                  fontSize: 20,
                ),
              ),
              const northmonth(),
              const SizedBox(
                height: 100,
              ),
              /*Container(
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
            ]),
          ),
        ),
      ),
    ]);
  }
}
