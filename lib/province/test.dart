import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class Thaicharts {
  final String provinces;
  final String count;
  final String color;

  Thaicharts({
    this.count,
    this.provinces,
    this.color,
  });

  Thaicharts.fromMap(Map<String, dynamic> map)
      : assert(map['provinces'] != null),
        assert(map['count'] != null),
        assert(map['color'] != null),
        count = map['provinces'],
        provinces = map['count'],
        color = map['color'];

  String toString() => "Record<$provinces:$count:$color>";
}

class testmonth extends StatefulWidget {
  const testmonth({Key key}) : super(key: key);
  @override
  _testmonthState createState() => _testmonthState();
}

class _testmonthState extends State<testmonth> {
  List<charts.Series<dynamic, String>> _seriesBarData;
  List<Thaicharts> mydata;
  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<dynamic, String>>();
    return [
      _seriesBarData.add(
        charts.Series<Thaicharts, String>(
            domainFn: (Thaicharts test, _) => test.count.toString(),
            measureFn: (Thaicharts test, _) => int.parse(test.provinces),
            colorFn: (test, _) =>
                charts.ColorUtil.fromDartColor(Color(int.parse(test.color))),
            id: 'test',
            data: mydata,
            labelAccessorFn: (Thaicharts test, _) => '${test.provinces}'),
      ),
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
      stream: FirebaseFirestore.instance.collection('test').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Thaicharts> test = snapshot.data.docs
              .map((documentSnapshot) =>
                  Thaicharts.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, test);
        }
      },
    );
  }

  /// original
  /*Widget _buildChart(BuildContext context, List<Northcharts> saledata) {
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
  Widget _buildChart(BuildContext context, List<Thaicharts> saledata) {
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
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: charts.BarChart(_seriesBarData,
                barGroupingType: charts.BarGroupingType.stacked,
                animate: true,
                vertical: true,
                barRendererDecorator: charts.BarLabelDecorator<String>(),
                behaviors: [
                  new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                          fontSize: 12, color: charts.MaterialPalette.black))
                ]),
          ),
        ),
      ),
    );
  }
}
