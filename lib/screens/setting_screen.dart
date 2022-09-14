import 'package:covid19/shared/constant.dart';
import 'package:covid19/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    Key key,
  }) : super(key: key);

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
            'ตั้งค่า',
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
                    '',
                    style: medium.copyWith(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const ItemWidget(
                    color: red,
                    image: 'mengenal.png',
                    title: 'การแจ้งเตือน',
                  ),
                  const ItemWidget(
                    color: orange,
                    image: 'mencegah.png',
                    title: 'อนุญาติติดตามตำแหน่ง GPS',
                  ),
                  const ItemWidget(
                    color: green,
                    image: 'mengobati.png',
                    title: 'ตั้งค่าเกี่ยวกับผู้ใช้งาน',
                  ),
                  const ItemWidget(
                    color: green,
                    image: 'mengantisipasi.png',
                    title: 'ตั้งค่าตำแหน่งผู้ใช้งาน',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
