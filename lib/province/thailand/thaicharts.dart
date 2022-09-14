import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class Thaicharts {
  final String month;
  final String count;
  final String color;

  Thaicharts({
    this.count,
    this.month,
    this.color,
  });

  Thaicharts.fromMap(Map<String, dynamic> map)
      : assert(map['month'] != null),
        assert(map['count'] != null),
        assert(map['color'] != null),
        count = map['month'],
        month = map['count'].toString(),
        color = map['color'];

  @override
  String toString() => "Record<$month:$count:$color>";
}

class thaimount extends StatefulWidget {
  const thaimount({Key key}) : super(key: key);
  @override
  _thaimountState createState() => _thaimountState();
}

class _thaimountState extends State<thaimount> {
  List<charts.Series<Thaicharts, String>> _seriesBarData;
  List<Thaicharts> mydata;
  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<Thaicharts, String>>();
    return [
      _seriesBarData.add(
        charts.Series<Thaicharts, String>(
            domainFn: (Thaicharts thai, _) => thai.count.toString(),
            measureFn: (Thaicharts thai, _) => int.tryParse(thai.month),
            colorFn: (thai, _) =>
                charts.ColorUtil.fromDartColor(Color(int.parse(thai.color))),
            id: 'Thai',
            data: mydata,
            labelAccessorFn: (Thaicharts thai, _) => '${thai.month}'),
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
      stream: FirebaseFirestore.instance.collection('thai').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Thaicharts> thai = snapshot.data.docs
              .map((documentSnapshot) =>
                  Thaicharts.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, thai);
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
                          color: charts.MaterialPalette.black))
                ]),
          ),
        ),
      ),
    );
  }
}
