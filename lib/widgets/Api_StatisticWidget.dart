import 'package:covid19/shared/constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiWIdget extends StatefulWidget {
  const ApiWIdget({
    Key key,
    this.number,
    this.link1,
    this.link2,
    this.child,
  });
  final int number;
  final Widget child;
  final String link1;
  final String link2;

  @override
  State<ApiWIdget> createState() => _ApiWIdgetState();
}

class _ApiWIdgetState extends State<ApiWIdget> {
  // ignore: unused_field

  // ignore: unused_field
  List<dynamic> _data = [];
  var _newCase;
  var _totalCase;
  var _newDeath;
  var _totalDeath;
  var _newRecovered;
  var _totalRecovered;
  String _DateTupdateDate;
  // ignore: missing_return
  Future<String> getData() async {
    var url = Uri.https(widget.link1, widget.link2, {'q': '{https}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      this.setState(() {
        _newCase = jsonResponse[widget.number]['new_case'];
        _totalCase = jsonResponse[widget.number]['total_case'];
        _newDeath = jsonResponse[widget.number]['new_death'];
        _totalDeath = jsonResponse[widget.number]['total_death'];
        _newRecovered = jsonResponse[widget.number]['new_recovered'];
        _totalRecovered = jsonResponse[widget.number]['total_recovered'];
        _DateTupdateDate = jsonResponse[widget.number]['update_date'];
      });
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    getData();
  }

  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/positif.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '+ ${_newCase}(วันนี้)',
                style: regular.copyWith(
                  color: orange,
                  fontSize: 15,
                ),
              ),
              Text(
                '${_totalCase}',
                style: regular.copyWith(
                  color: orange,
                  fontSize: 15,
                ),
              ),
              Text(
                'ผู้ติดเชื้อทั้งหมด\n\n',
                style: regular.copyWith(
                  color: orange,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/sembuh.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '+ ${_newRecovered}(วันนี้)',
                style: regular.copyWith(
                  color: green,
                  fontSize: 15,
                ),
              ),
              Text(
                '${_totalRecovered}',
                style: regular.copyWith(
                  color: red,
                  fontSize: 15,
                ),
              ),
              Text(
                'กำลังรักษา\n',
                style: regular.copyWith(
                  color: green,
                  fontSize: 14,
                ),
              ),
              Text(
                'ข้อมูลวันที่ ${_DateTupdateDate}',
                style: regular.copyWith(
                  color: black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/meninggal.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '+ ${_newDeath}(วันนี้)',
                style: regular.copyWith(
                  color: red,
                  fontSize: 15,
                ),
              ),
              Text(
                '${_totalDeath}',
                style: regular.copyWith(
                  color: red,
                  fontSize: 15,
                ),
              ),
              Text(
                'เสียชีวิตทั้งหมด\n\n',
                style: regular.copyWith(
                  color: red,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
