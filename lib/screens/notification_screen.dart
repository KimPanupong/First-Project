// ignore_for_file: deprecated_member_use

import 'package:covid19/address/welcome.dart';
import 'package:covid19/shared/constant.dart';
import 'package:covid19/widgets/Pagewidget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../widgets/Api_StatisticWidget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String country = '';
  String name = '';
  String street = '';
  String postalCode = '';
///////////////
  String locality = '';
  String subLocality = '';
  String subThoroughfare = '';
  String thoroughfare = '';
  String administrativeArea = '';
  String isoCountryCode = '';
  String subAdministrativeArea = '';
  int num1;
  String pro1;
  String pro2;
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  Future<void> getLocation() async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(UserLocation.lat, UserLocation.long);

    print(placemark[0].country);
    print(placemark[0].name);
    print(placemark[0].street);
    print(placemark[0].postalCode);
    print(placemark[0].locality);
    print(placemark[0].subLocality);
    print(placemark[0].subThoroughfare);
    print(placemark[0].thoroughfare);
    print(placemark[0].administrativeArea);
    print(placemark[0].isoCountryCode);
    print(placemark[0].subAdministrativeArea);

    setState(() {
      country = placemark[0].country;
      name = placemark[0].name;
      street = placemark[0].street;
      postalCode = placemark[0].postalCode;
      //////////////////
      locality = placemark[0].locality;
      subLocality = placemark[0].subLocality;
      subThoroughfare = placemark[0].subThoroughfare;
      thoroughfare = placemark[0].thoroughfare;
      administrativeArea = placemark[0].administrativeArea;
      isoCountryCode = placemark[0].isoCountryCode;
      subAdministrativeArea = placemark[0].subAdministrativeArea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bantuan.png',
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 100),
          child: Text(
            'การแจ้งเตือน',
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
            height: MediaQuery.of(context).size.height * 0.72,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'แสดงผู้ติดเชื้อที่เพิ่มขึ้นภายในวันนี้',
                    style: medium.copyWith(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'จะแสดงจำนวนผู้ติดเชื้อและเสียชีวิตที่เพิ่มขึ้นในวันนี้ ',
                          style: regular.copyWith(
                            color: body,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '\nตามตำแหน่งของจังหวัดที่ผู้ใช้',
                          style: regular.copyWith(
                            color: green,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                      height: 40,
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" :" + "$administrativeArea"),
                          Text(" :" + "$locality"),
                          Text(":" + "$subLocality"),
                          Text(" :" + "$subAdministrativeArea"),
                          Text(" : " + "$country"),

                          //  Text("เลขที่:" + "$name"),
                          //  Text("ถนน:" + "$street"),
                          //  Text("รหัสไปรษณีย์:" + "$postalCode"),
///////////////

                          //  Text("ทางสัญจรย่อย:" + "$subThoroughfare"),
                          //  Text("ทางสัญจร:" + "$thoroughfare"),
                          // Text("รหัสประเทศ:" + "$isoCountryCode"),
                        ],
                      ))),
                  SizedBox(height: 10, child: getlocationprovinces()),
                  ApiWIdget(
                    link1: 'covid19.ddc.moph.go.th',
                    link2: 'api/Cases/today-cases-by-provinces',
                    number: num1,
                  ),
                  getbutton(),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: missing_return
  Widget getlocationprovinces() {
    int num;
    String pro;
    String thai;

    if (administrativeArea == 'Chang Wat Phayao' ||
        administrativeArea == 'Phayao' ||
        administrativeArea == 'จังหวัดพะเยา' ||
        administrativeArea == 'พะเยา') {
      // พะเยา
      num = 55;
      pro = 'phayao';
      thai = 'พะเยา';
    } else if (administrativeArea == 'Chang Wat Chiang Rai' ||
        administrativeArea == 'Chiang Rai' ||
        administrativeArea == 'จังหวัดเชียงราย' ||
        administrativeArea == 'เชียงราย') {
      // เชียงราย
      num = 45;
      pro = 'chiangrai';
      thai = 'เชียงราย';
    } else if (administrativeArea == 'Chang Wat Chiang Mai' ||
        administrativeArea == 'Chiang Mai' ||
        administrativeArea == 'จังหวัดเชียงใหม่' ||
        administrativeArea == 'เชียงใหม่') {
      // เชียงใหม่
      num = 26;
      pro = 'chiangmai';
      thai = 'เชียงใหม่';
    } else if (administrativeArea == 'Chang Wat Nan' ||
        administrativeArea == 'Nan' ||
        administrativeArea == 'จังหวัดน่าน' ||
        administrativeArea == 'น่าน') {
      // น่าน
      num = 39;
      pro = 'nan';
      thai = 'น่าน';
    } else if (administrativeArea == 'Chang Wat Phrae' ||
        administrativeArea == 'Phrae' ||
        administrativeArea == 'จังหวัดแพร่' ||
        administrativeArea == 'แพร่') {
      // แพร่
      num = 6;
      pro = 'phrae';
      thai = 'แพร่';
    } else if (administrativeArea == 'Chang Wat Mae Hong Son' ||
        administrativeArea == 'Mae Hong Son' ||
        administrativeArea == 'จังหวัดแม่ฮ่องสอน' ||
        administrativeArea == 'แม่ฮ่องสอน') {
      // แม่ฮ่องสอน
      num = 75;
      pro = 'maehongson';
      thai = 'แม่ฮ่องสอน';
    } else if (administrativeArea == 'Chang Wat Lumpang' ||
        administrativeArea == 'Lumpang' ||
        administrativeArea == 'จังหวัดลำปาง' ||
        administrativeArea == 'ลำปาง') {
      // ลำปาง
      num = 54;
      pro = 'lumpang';
      thai = 'ลำปาง';
    } else if (administrativeArea == 'Chang Wat Lumphun' ||
        administrativeArea == 'Lumphun' ||
        administrativeArea == 'จังหวัดลำพูน' ||
        administrativeArea == 'ลำพูน') {
      // ลำพูน
      num = 35;
      pro = 'lumphun';
      thai = 'ลำพูน';
    } else if (administrativeArea == 'Chang Wat Uttaradit' ||
        administrativeArea == 'Uttaradit' ||
        administrativeArea == 'จังหวัดอุตรดิตถ์' ||
        administrativeArea == 'อุตรดิตถ์') {
      // อุตรดิตถ์
      num = 7;
      pro = 'uttaradit';
      thai = 'อุตรดิตถ์';
    } else {
      // กรุงเทพ
      num = 0;
    }
    setState(() => num1 = num);
    setState(() => pro1 = pro);
    setState(() => pro2 = thai);
  }

  Widget getbutton() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                      title: pro2,
                      number: num1,
                      chart: pro1,
                      link1: 'covid19.ddc.moph.go.th',
                      link2: 'api/Cases/today-cases-by-provinces')));
        },
        color: Colors.green,
        child: Text(
          'ข้อมูลสถิติแต่ละอำเภอ',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
