import 'package:flutter/material.dart';

import 'package:cheklist/core/app_gradients.dart';
import 'package:cheklist/home/home_page.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage(title: 'Lista de Manutenção')),
    ));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
      ),
    );
  }
}