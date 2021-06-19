import 'package:flutter/material.dart';

import 'package:cheklist/core/core.dart';

class FormInput extends StatelessWidget {
  final String label;

  const FormInput({
    Key key,    
    this.label,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite um valor válido.';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: '$label',
        fillColor: AppColors.font,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.lightPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.gray,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
