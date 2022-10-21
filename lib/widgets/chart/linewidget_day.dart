import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
class chart {
  final String sub;
  final String count;
  final String color;

  chart({
    this.count,
    this.sub,
    this.color,
  });

  chart.fromMap(Map<String, dynamic> map)
      : /*assert(map['sub'] != null),
        assert(map['count'] != null),
        assert(map['color'] != null),*/
        count = map['sub'].toString() ?? 0,
        sub = map['count'].toString(),
        color = map['color'].toString();

  @override
  String toString() => "Record<$sub:$count:$color>";
}

// ignore: must_be_immutable
class Widget_day extends StatefulWidget {
  const Widget_day({
    Key key,
    this.title,
    this.title1,
    this.child,
  });
  final String title;
  final Widget child;
  final String title1;

  @override
  State<Widget_day> createState() => _Widget_dayState();
}

class _Widget_dayState extends State<Widget_day> {
  List<chart> mydata;

  _generateData(mydata) {
    // ignore: deprecated_member_use
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(widget.title).snapshots(),
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
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<chart, String>>[
                      LineSeries<chart, String>(
                        dataSource: mydata,
                        xValueMapper: (chart title, _) => title.count,
                        yValueMapper: (chart title, _) =>
                            int.tryParse(title.sub),
                        name: widget.title1,
                        color: green,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                        ),
                      )
                    ]),
              ),
            )),
      ),
    );
  }
}
