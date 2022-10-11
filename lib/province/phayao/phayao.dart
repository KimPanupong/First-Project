// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';

import 'package:covid19/shared/constant.dart';
import 'package:flutter/material.dart';

import '../../widgets/chartswidget_day.dart';
import '../../widgets/chartswidget_month.dart';
import '../../widgets/chartswidget_week.dart';

//////////////////////////////////////////////////////////////////////
class Phayao extends StatefulWidget {
  const Phayao({Key key}) : super(key: key);

  @override
  State<Phayao> createState() => _PhayaoState();
}

class _PhayaoState extends State<Phayao> {
  int Page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/informasi.png',
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28, top: 90),
          child: Text(
            'จังหวัดพะเยา',
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
            height: MediaQuery.of(context).size.height * 0.8,
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
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 5),
                      child: RaisedButton(
                        color: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back', style: regular),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'วิเคราะห์ข้อมูล',
                      style: medium.copyWith(
                        color: black,
                        fontSize: 38,
                      ),
                    ),
                    getTabs(),
                    const SizedBox(
                      height: 24,
                    ),
                    IndexedStack(
                      index: Page,
                      children: [getday(), getweek(), getmonth()],
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }

  Widget getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Page == 0
              ? Flexible(
                  child: ElasticIn(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Page = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: (size.width - 45) / 3,
                        height: 50,
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "รายวัน",
                            style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      Page = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 3,
                      height: 50,
                      decoration: BoxDecoration(
                          // color: primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "รายวัน",
                          style: TextStyle(
                              fontSize: 15,
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
          Page == 1
              ? Flexible(
                  child: ElasticIn(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Page = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: (size.width - 45) / 4,
                        height: 50,
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "รายสัปดาห์",
                            style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      Page = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 4,
                      height: 50,
                      decoration: BoxDecoration(
                          // color: primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "รายสัปดาห์",
                          style: TextStyle(
                              fontSize: 15,
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
          Page == 2
              ? Flexible(
                  child: ElasticIn(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Page = 2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: (size.width - 45) / 3,
                        height: 50,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "รายเดือน",
                            style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      Page = 2;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 3,
                      height: 50,
                      decoration: BoxDecoration(
                          // color: primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "รายเดือน",
                          style: TextStyle(
                              fontSize: 15,
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget getday() {
    return Wrap(runSpacing: 20, spacing: 20, children: [
      Charts_day(title: 'phayaoday'),
      const SizedBox(
        height: 60,
      )
    ]);
  }

  Widget getweek() {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        Charts_week(title: 'phayaoday'),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }

  Widget getmonth() {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        Charts_month(title: 'phayaoday'),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
