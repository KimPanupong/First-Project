import 'package:covid19/province/chiangmai.dart';
import 'package:covid19/province/chiangrai.dart';
import 'package:covid19/province/lumpang.dart';
import 'package:covid19/province/lumphun.dart';
import 'package:covid19/province/maehongson.dart';
import 'package:covid19/province/nan.dart';
import 'package:covid19/province/phayao.dart';
import 'package:covid19/province/phrae.dart';
import 'package:covid19/province/uttaradit.dart';
import 'package:covid19/shared/constant.dart';

import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({
    Key key,
  }) : super(key: key);

  final String city = 'ภาคเหนือ';
  final List<String> cities = [
    ['ภาคเหนือ'][0],
    ['เชียงราย'][0],
    ['เชียงใหม่'][0],
    ['น่าน'][0],
    ['พะเยา'][0],
    ['แพร่'][0],
    ['แม่ฮ่องสอน'][0],
    ['ลำปาง'][0],
    ['ลำพูน'][0],
    ['อุตรดิตถ์'][0],
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: green),
          borderRadius: BorderRadius.circular(100),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: green),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: green),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      value: city,
      items: cities
          .map(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
      onChanged: (String val) {
        /*if (val == cities[0]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StatisticWidget()),
          );
        }
        ;*/
        if (val == cities[1]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Chiangrai()),
          );
        }
        ;
        if (val == cities[2]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Chiangmai()),
          );
        }
        ;
        if (val == cities[3]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Nan()),
          );
        }
        ;
        if (val == cities[4]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Phayao()),
          );
        }
        ;
        if (val == cities[5]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Phrae()),
          );
        }
        ;
        if (val == cities[6]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Maehongson()),
          );
        }
        ;
        if (val == cities[7]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Lumpang()),
          );
        }
        ;
        if (val == cities[8]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Lumphun()),
          );
        }
        ;
        if (val == cities[9]) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Uttaradit()),
          );
        }
        ;
      },
    );
  }
}
