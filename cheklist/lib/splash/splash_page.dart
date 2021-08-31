import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/core/core.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/home/home_page.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(title: 'Lista de Manutenção')),
    ));
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.success
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.agriculture,
                    color: AppColors.white,
                    size: 100,
                  ),
                  Text('Revisão de tratores', style: AppTextStyles.splashScreen)
                ],
              ),
            )
          ],
        )
      ), 
    );
  }
}