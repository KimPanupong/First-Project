import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class chart {
  final String sub;
  final String countmonth;
  final String color;

  chart({
    this.countmonth,
    this.sub,
    this.color,
  });

  chart.fromMap(Map<String, dynamic> map)
      : /*assert(map['sub'] != null),
        assert(map['countmonth'] != null),
        assert(map['color'] != null),*/
        countmonth = map['sub'].toString() ?? 0,
        sub = map['countmonth'].toString(),
        color = map['color'].toString();

  @override
  String toString() => "Record<$sub:$countmonth:$color>";
}

// ignore: must_be_immutable
class Charts_month extends StatelessWidget {
  final String title;

  final Widget custom;
  Charts_month({
    Key key,
    this.title,
    this.custom,
  }) : super(key: key);
  List<charts.Series<chart, String>> _seriesBarData;
  List<chart> mydata;

  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<chart, String>>();
    return [
      _seriesBarData.add(
        charts.Series<chart, String>(
          domainFn: (chart title, _) => title.countmonth.toString(),
          measureFn: (chart title, _) => int.tryParse(title.sub),
          colorFn: (title, _) =>
              charts.ColorUtil.fromDartColor(Color(int.parse(title.color))),
          id: 'Northsub',
          data: mydata,
          labelAccessorFn: (chart Charts_month, _) => '${Charts_month.sub}',
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(title).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<chart> title = snapshot.data.docs
              .map((documentSnapshot) => chart.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, title);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<chart> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: body.withOpacity(0.1),
            offset: const Offset(0.0, 0.0),
            blurRadius: 16,
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: charts.BarChart(
              _seriesBarData,
              animate: true,
              vertical: false,
              barRendererDecorator: charts.BarLabelDecorator<String>(),
            ),
          ),
        ),
      ),
    );
  }
}
