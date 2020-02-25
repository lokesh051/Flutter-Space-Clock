// import flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import the clock
import 'analog_clock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Clock by Lokesh',
      debugShowCheckedModeBanner: false,
      home: Clock(),
    );
  }
}
