import 'package:flutter/material.dart';
import 'package:cheklist/splash/splash_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Revisão de tratores',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashPage(),
        );
      }
    );
  }
}
