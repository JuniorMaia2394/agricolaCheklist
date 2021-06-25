import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/core/core.dart';

class FormInputName extends StatelessWidget {
  final String label;
  final int maxLength;
  final TextEditingController nameController;

  const FormInputName({
    Key key,    
    this.label,
    this.maxLength,
    this.nameController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite um nome válido.';
        }
        return null;
      },
      controller: nameController,
      maxLength: maxLength,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: '$label',
        hintText: 'Insira o seu nome',
        fillColor: AppColors.font,
        border: OutlineInputBorder(),
        counterText: '',
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.lightDanger,
          ),
        ),
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
