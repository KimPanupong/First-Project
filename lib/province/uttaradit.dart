// ignore_for_file: deprecated_member_use

import 'package:covid19/shared/constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UttaraditStatisticutWidget extends StatefulWidget {
  const UttaraditStatisticutWidget({Key key}) : super(key: key);

  @override
  State<UttaraditStatisticutWidget> createState() =>
      _UttaraditStatisticutWidgetState();
}

class _UttaraditStatisticutWidgetState
    extends State<UttaraditStatisticutWidget> {
  // ignore: unused_field
  List<dynamic> _data = [];
  var _newCase = 0;
  var _totalCase = 0;
  var _newDeath = 0;
  var _totalDeath = 0;
  var _newRecovered = 0;
  var _totalRecovered = 0;
  String _DateTupdateDate;
  // ignore: missing_return
  Future<String> getData() async {
    var url = Uri.https('covid19.ddc.moph.go.th',
        '/api/Cases/today-cases-by-provinces', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      this.setState(() {
        _newCase = jsonResponse[67]['new_case'];
        _totalCase = jsonResponse[67]['total_case'];
        _newDeath = jsonResponse[67]['new_death'];
        _totalDeath = jsonResponse[67]['total_death'];
        _newRecovered = jsonResponse[67]['new_case_excludeabroad'];
        _totalRecovered = jsonResponse[67]['total_case_excludeabroad'];
        _DateTupdateDate = jsonResponse[67]['update_date'];
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

//////////////////////////////////////////////////////////////////////
class Uttaradit extends StatelessWidget {
  const Uttaradit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/informasi.png',
        width: MediaQuery.of(context).size.width,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28, top: 90),
        child: Text(
          'จังหวัดอุตรดิตถ์',
          style: bold.copyWith(
            color: white,
            fontSize: 36,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              const UttaraditStatisticutWidget(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'วิเคราะห์ข้อมูล',
                style: medium.copyWith(
                  color: black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/images/peta.png'),
              ),
              const SizedBox(
                height: 24,
              ),
            ]),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20, top: 155),
        child: RaisedButton(
          color: green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back', style: regular),
        ),
      ),
    ]);
  }
}
