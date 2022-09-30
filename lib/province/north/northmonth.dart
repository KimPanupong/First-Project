import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class North_month {
  final String month;
  final String count;
  final String color;

  North_month({
    this.count,
    this.month,
    this.color,
  });

  North_month.fromMap(Map<String, dynamic> map)
      : assert(map['month'] != null),
        assert(map['count'] != null),
        assert(map['color'] != null),
        count = map['month'],
        month = map['count'],
        color = map['color'];

  @override
  String toString() => "Record<$month:$count:$color>";
}

class northmonth extends StatefulWidget {
  const northmonth({Key key}) : super(key: key);
  @override
  _northmonthState createState() => _northmonthState();
}

class _northmonthState extends State<northmonth> {
  List<charts.Series<North_month, String>> _seriesBarData;
  List<North_month> mydata;

  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<North_month, String>>();
    return [
      _seriesBarData.add(
        charts.Series<North_month, String>(
          domainFn: (North_month northmonth, _) => northmonth.count.toString(),
          measureFn: (North_month northmonth, _) =>
              int.tryParse(northmonth.month),
          colorFn: (northmonth, _) => charts.ColorUtil.fromDartColor(
              Color(int.parse(northmonth.color))),
          id: 'Northmonth',
          data: mydata,
          labelAccessorFn: (North_month northmonth, _) => '${northmonth.month}',
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
      stream: FirebaseFirestore.instance.collection('northmonth').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<North_month> northmonth = snapshot.data.docs
              .map((documentSnapshot) =>
                  North_month.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, northmonth);
        }
      },
    );
  }

  /// original
  /*Widget _buildChart(BuildContext context, List<North_month> saledata) {
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
  Widget _buildChart(BuildContext context, List<North_month> saledata) {
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
