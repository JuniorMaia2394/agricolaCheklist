import 'package:flutter/material.dart';

import 'package:cheklist/core/core.dart';

class FormCard extends StatelessWidget {
  final String title;
  final String cardNumber;

  const FormCard({
    Key key,
    this.title,
    this.cardNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    child: TextButton(
                      child: const Text('OK'),
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.success,
                          primary: AppColors.white),
                      onPressed: () {/* ... */},
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: TextButton(
                    child: const Text(' DEFEITO '),
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.danger,
                        primary: AppColors.white),
                    onPressed: () {/* ... */},
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
