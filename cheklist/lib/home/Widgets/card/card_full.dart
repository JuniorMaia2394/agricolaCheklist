import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/core/app_text_styles.dart';

import 'package:flutter/material.dart';

class CardFull extends StatefulWidget {
  final String title;
  final String cardNumber;

  const CardFull({
    Key key,
    this.title,
    this.cardNumber,
  }) : super(key: key);

  @override
  _CardFullState createState() => _CardFullState();
}

class _CardFullState extends State<CardFull> {
  var _cor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    String title;
    String cardNumber;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: _cor,
          width: 2.0,
        ),
      ),
      shadowColor: AppColors.black.withOpacity(1),
      child: Column(
        children: <Widget>[
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '$cardNumber',
                style: AppTextStyles.cardNumber,
              ),
            ),
            Text(
              '$title',
              style: AppTextStyles.label,
            ),
          ]),
          Icon(
            Icons.agriculture,
            size: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 70,
                    height: 40,
                    child: ElevatedButton(
                      child: const Text('OK'),
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.success,
                          primary: AppColors.white),
                      onPressed: () {
                        setState(() {
                          _cor = AppColors.success;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('DEFEITO'),
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.danger,
                        primary: AppColors.white),
                    onPressed: () {
                      setState(() {
                        _cor = AppColors.danger;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
