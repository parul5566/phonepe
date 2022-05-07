import 'package:flutter/material.dart';
import 'package:phonepe/ui/phonepe.dart';
import 'package:phonepe/ui/splashscreen.dart';

import 'constant/Constant.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: new ThemeData(primaryColor: Colors.blue[800],
      ),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        PHONE_PE: (BuildContext context) => FlutterDevs(),
      },
    );
  }
}