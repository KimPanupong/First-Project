import 'package:covid19/shared/constant.dart';
import 'package:flutter/material.dart';

import 'Pagewidget.dart';

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
          if (val == cities[1]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดเชียงราย",
                        chart: 'chiangrai',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 45,
                      )),
            );
          }
          ;
          if (val == cities[2]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดเชียงใหม่",
                        chart: 'chiangmai',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 26,
                      )),
            );
          }
          ;
          if (val == cities[3]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดน่าน",
                        chart: 'nan',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 39,
                      )),
            );
          }
          ;
          if (val == cities[4]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดพะเยา",
                        chart: 'phayao',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 55,
                      )),
            );
          }
          ;
          if (val == cities[5]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดแพร่",
                        chart: 'phrae',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 6,
                      )),
            );
          }
          ;
          if (val == cities[6]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดแม่ฮ่องสอน",
                        chart: 'maehongson',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 75,
                      )),
            );
          }
          ;
          if (val == cities[7]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดลำปาง",
                        chart: 'lumpang',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 54,
                      )),
            );
          }
          ;
          if (val == cities[8]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดลำพูน",
                        chart: 'lumphun',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 35,
                      )),
            );
          }
          ;
          if (val == cities[9]) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageWidget(
                        title: "จังหวัดอุตรดิตถ์",
                        chart: 'uttaradit',
                        link1: 'covid19.ddc.moph.go.th',
                        link2: 'api/Cases/today-cases-by-provinces',
                        number: 7,
                      )),
            );
          }
        });
  }
}
