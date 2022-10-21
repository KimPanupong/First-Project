// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:syncfusion_flutter_charts/charts.dart';

// //ตัวแปลของกราฟที่ดึงข้อมูลเข้ามาจาก firestore
// class chart {
//   final String sub;
//   final String count;
//   final String color;

//   chart({
//     this.count,
//     this.sub,
//     this.color,
//   });

//   chart.fromMap(Map<String, dynamic> map)
//       : /*assert(map['sub'] != null),
//         assert(map['count'] != null),
//         assert(map['color'] != null),*/
//         sub = map['sub'] ?? 0,
//         count = map['count'].toString(),
//         color = map['color'];

//   @override
//   String toString() => "Record<$sub:$count:$color>";
// }

// // ignore: must_be_immutable
// class line extends StatefulWidget {
//   const line({
//     Key key,
//     this.title,
//     this.child,
//   });
//   final String title;
//   final Widget child;

//   @override
//   State<line> createState() => _lineState();
// }

// class _lineState extends State<line> {
  

//   Future<String> getLsonFromFirebase() async {
//     String url =
//         'https://login-9a120-default-rtdb.firebaseio.com/1FG8VdS91V8CvpbcuLxFQyQdXGuHT9sfomZ2k2JEl1o8.json';
//     http.Response response = await http.get(Uri.parse(url));
//     return response.body;
//   }

//   Future loadSalesData() async {
//     final String jsonString = await getLsonFromFirebase();
//     final dynamic jsonResponse = json.decode(jsonString);
//     for (Map<String, dynamic> i in jsonResponse) {
//       sales.add(SalesDetails.fromJson(i));
//     }
//   }

//   @override
//   void initState() {
//     loadSalesData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: FutureBuilder(
//             future: getLsonFromFirebase(),
//             builder: (context, snpshot) {
//               if (snpshot.hasData) {
//                 return (SfCartesianChart(
//                   primaryYAxis: CategoryAxis(),
//                   series: <ChartSeries>[
//                     LineSeries<SalesDetails, String>(
//                         dataSource: sales,
//                         xValueMapper: (SalesDetails details, _) =>
//                             details.sub,
//                         yValueMapper: (SalesDetails details, _) =>
//                             details.salesCount)
//                   ],
//                 ));
//               }
//             }),
//       ),
//     );
//   }
// }
