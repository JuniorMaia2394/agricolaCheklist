import 'package:cheklist/helpers/uppercaseTextFormatter.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/core/core.dart';

class FormInputDefeito extends StatefulWidget {
  final String label;
  final int maxLength;
  final TextEditingController defectFieldController;

  const FormInputDefeito({
    Key key,
    this.label,
    this.maxLength,
    this.defectFieldController,
  }) : super(key: key);

  @override
  FormInputDefeitoState createState() {
    return FormInputDefeitoState();
  }
}

class FormInputDefeitoState extends State<FormInputDefeito> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: TextFormField(
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, digite uma defeito válido.';
          }
          return null;
        },
        maxLength: widget.maxLength,
        controller: widget.defectFieldController,
        inputFormatters: [UppercaseTextFormatter()],
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: 'Descreva o defeito',
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
      ),
    );
  }
}
