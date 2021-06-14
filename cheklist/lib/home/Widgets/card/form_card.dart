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
          const ListTile(
            title: Text(
              '2 - Verificar nível de óleo hidráulico',
              style: TextStyle(),
            ),
          ),
          Icon(
            Icons.agriculture,
            size: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.success,
                    primary: AppColors.white 
                  ),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('DEFEITO'),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.danger,
                    primary: AppColors.white
                  ),
                  onPressed: () {/* ... */},
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
