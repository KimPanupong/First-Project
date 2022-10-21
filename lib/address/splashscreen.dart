import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../screens/wrapper_screen.dart';
import 'welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    locationService();
  }

  Future<void> locationService() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionLocation;
    LocationData _locData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionLocation = await location.hasPermission();
    if (_permissionLocation == PermissionStatus.denied) {
      _permissionLocation = await location.requestPermission();
      if (_permissionLocation != PermissionStatus.granted) {
        return;
      }
    }

    _locData = await location.getLocation();

    setState(() {
      UserLocation.lat = _locData.latitude;
      UserLocation.long = _locData.longitude;
    });

    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WrapperScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "กำลังติดตามตำแหน่งผู้ใช้",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
