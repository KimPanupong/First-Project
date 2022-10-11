import "package:cloud_firestore/cloud_firestore.dart";
import 'package:covid19/shared/constant.dart';
import 'package:flutter/material.dart';

class ABC extends StatelessWidget {
  final String title;
  final Widget custom;
  const ABC({
    Key key,
    this.title,
    this.custom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(title).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Text('Something went wrong');
        } else {
          return Column(
            children: snapshot.data.docs.map((document) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
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
                          '+' + document["newcase"].toString() + '(วันนี้)',
                          style: regular.copyWith(
                            color: orange,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document["totalcase"].toString(),
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
                          '+' + document["recovery"].toString() + '(วันนี้)',
                          style: regular.copyWith(
                            color: orange,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document["totalrecovery"].toString(),
                          style: regular.copyWith(
                            color: orange,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'กำลังรักษา\n',
                          style: regular.copyWith(
                            color: orange,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          document["datetime"],
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
                          '+' + document["newdeath"].toString() + '(วันนี้)',
                          style: regular.copyWith(
                            color: red,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document["totaldeath"].toString(),
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
            }).toList(),
          );
        }
      },
    );
  }
}
