import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class Demo {
  final String week;
  final String number;

  Demo({this.number, this.week});

  Demo.fromMap(Map<String, dynamic> map)
      : assert(map['week'] != null),
        assert(map['number'] != null),
        week = map['week'].toString(),
        number = map['number'];

  //String toString() => "Record<$week:$number>";
}

class demolinecharts extends StatefulWidget {
  const demolinecharts({Key key}) : super(key: key);
  @override
  _demolinechartsState createState() => _demolinechartsState();
}

class _demolinechartsState extends State<demolinecharts> {
  List<charts.Series<Demo, int>> _seriesBarData;
  List<Demo> mydata;
  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<Demo, int>>();
    return [
      _seriesBarData.add(
        charts.Series<Demo, int>(
            domainFn: (Demo linecharts, _) => int.parse(linecharts.week),
            measureFn: (Demo linecharts, _) => int.parse(linecharts.number),
            id: 'linecharts',
            data: mydata,
            labelAccessorFn: (Demo linecharts, _) => '${linecharts.week}'),
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
      stream: FirebaseFirestore.instance.collection('linecharts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Demo> linecharts = snapshot.data.docs
              .map((documentSnapshot) => Demo.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, linecharts);
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
  Widget _buildChart(BuildContext context, List<Demo> saledata) {
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
            child: charts.LineChart(_seriesBarData,
                //barGroupingType: charts.BarGroupingType.stacked,
                animate: true,

                //vertical: true,
                //barRendererDecorator: charts.BarLabelDecorator<String>(),
                behaviors: [
                  new charts.ChartTitle('WEEK',
                      titleStyleSpec: charts.TextStyleSpec(fontSize: 15),
                      behaviorPosition: charts.BehaviorPosition.bottom,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                  new charts.ChartTitle('COUNT',
                      titleStyleSpec: charts.TextStyleSpec(fontSize: 15),
                      behaviorPosition: charts.BehaviorPosition.start,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
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
