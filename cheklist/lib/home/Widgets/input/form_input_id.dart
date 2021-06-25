import 'package:cheklist/helpers/uppercaseTextFormatter.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/core/core.dart';

class FormInputId extends StatefulWidget {
  final String label;
  final int maxLength;
  final TextEditingController tractorIdController;

  const FormInputId({
    Key key,    
    this.label,
    this.maxLength,
    this.tractorIdController,
  }) : super(key: key);

  @override
  FormInputIdState createState() {
    return FormInputIdState();
  }
}

class FormInputIdState extends State<FormInputId> {

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite uma indentificação válida.';
        }
        return null;
      },
      maxLength: widget.maxLength,
      controller: widget.tractorIdController,
      inputFormatters: [
        UppercaseTextFormatter()
      ],
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: 'AF-1233',
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
