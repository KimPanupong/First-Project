import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class North_provinces {
  final String provinces;
  final String count;
  final String color;

  North_provinces({
    this.count,
    this.provinces,
    this.color,
  });

  North_provinces.fromMap(Map<String, dynamic> map)
      : assert(map['provinces'] != null),
        assert(map['count'] != null),
        assert(map['color'] != null),
        count = map['provinces'],
        provinces = map['count'],
        color = map['color'];

  @override
  String toString() => "Record<$provinces:$count:$color>";
}

class northday extends StatefulWidget {
  const northday({Key key}) : super(key: key);
  @override
  _northdayState createState() => _northdayState();
}

class _northdayState extends State<northday> {
  List<charts.Series<North_provinces, String>> _seriesBarData;
  List<North_provinces> mydata;

  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<North_provinces, String>>();
    return [
      _seriesBarData.add(
        charts.Series<North_provinces, String>(
          domainFn: (North_provinces northday, _) => northday.count.toString(),
          measureFn: (North_provinces northday, _) =>
              int.tryParse(northday.provinces),
          colorFn: (northday, _) =>
              charts.ColorUtil.fromDartColor(Color(int.parse(northday.color))),
          id: 'Northprovinces',
          data: mydata,
          labelAccessorFn: (North_provinces northday, _) =>
              '${northday.provinces}',
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
      stream: FirebaseFirestore.instance.collection('northday').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<North_provinces> northday = snapshot.data.docs
              .map((documentSnapshot) =>
                  North_provinces.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, northday);
        }
      },
    );
  }

  /// original
  /*Widget _buildChart(BuildContext context, List<North_provinces> saledata) {
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
  Widget _buildChart(BuildContext context, List<North_provinces> saledata) {
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
