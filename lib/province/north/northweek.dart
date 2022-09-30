import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class North_week {
  final String week;
  final String count;
  final String color;

  North_week({
    this.count,
    this.week,
    this.color,
  });

  North_week.fromMap(Map<String, dynamic> map)
      : assert(map['week'] != null),
        assert(map['count'] != null),
        assert(map['color'] != null),
        count = map['week'],
        week = map['count'],
        color = map['color'];

  @override
  String toString() => "Record<$week:$count:$color>";
}

class northweek extends StatefulWidget {
  const northweek({Key key}) : super(key: key);
  @override
  _northweekState createState() => _northweekState();
}

class _northweekState extends State<northweek> {
  List<charts.Series<North_week, String>> _seriesBarData;
  List<North_week> mydata;

  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<North_week, String>>();
    return [
      _seriesBarData.add(
        charts.Series<North_week, String>(
          domainFn: (North_week northweek, _) => northweek.count.toString(),
          measureFn: (North_week northweek, _) => int.tryParse(northweek.week),
          colorFn: (northweek, _) =>
              charts.ColorUtil.fromDartColor(Color(int.parse(northweek.color))),
          id: 'Northweek',
          data: mydata,
          labelAccessorFn: (North_week northweek, _) => '${northweek.week}',
        ),
      )
    ];
  }

  @override
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CHARTS')),
      body: _buildBody(context),
    );
  }*/

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('northweek').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<North_week> northweek = snapshot.data.docs
              .map((documentSnapshot) =>
                  North_week.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, northweek);
        }
      },
    );
  }

  /// original
  /*Widget _buildChart(BuildContext context, List<North_week> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: charts.BarChart(_seriesBarData, animate: true, behaviors: [
              new charts.DatumLegend(
                entryTextStyle:
                    charts.TextStyleSpec(color: charts.MaterialPalette.black),
              )
            ]),
          ),
        ),
      ),
    );
  }
}*/
  Widget _buildChart(BuildContext context, List<North_week> saledata) {
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
              vertical: true,
              barRendererDecorator: charts.BarLabelDecorator<String>(),
            ),
          ),
        ),
      ),
    );
  }
}
