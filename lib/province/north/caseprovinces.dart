import "package:cloud_firestore/cloud_firestore.dart";
import 'package:covid19/shared/constant.dart';
import 'package:flutter/material.dart';

class caseprovincesStatisticWidget extends StatefulWidget {
  const caseprovincesStatisticWidget({Key key}) : super(key: key);
  @override
  _caseprovincesStatisticWidget createState() =>
      _caseprovincesStatisticWidget();
}

class _caseprovincesStatisticWidget
    extends State<caseprovincesStatisticWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("caseprovinces").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Text('Something went wrong');
        } else {
          return Column(
            children: snapshot.data.docs.map((document) {
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
                  child: ListTile(
                    title: Text(
                      document["provinces"],
                      style: regular.copyWith(
                        color: black,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      'ผู้ติดเชื้อวันนี้' + ' + ' + document["count"],
                      style: regular.copyWith(
                        color: black,
                        fontSize: 12,
                      ),
                    ),
                  ));
            }).toList(),
          );
        }
      },
    );
  }
}
