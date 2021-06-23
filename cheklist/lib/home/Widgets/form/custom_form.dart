import 'dart:async';

import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:cheklist/home/Widgets/input/form_input.dart';
import 'package:cheklist/home/Widgets/card/form_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:cheklist/mobile.dart';

import 'package:pdf/widgets.dart' as pw;

class CustomForm extends StatefulWidget {
  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CustomFormState extends State<CustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<CustomFormState>.
  final tractorProblemsData = {...TRACTOR_PROBLEMS};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormInput(label: 'Nome do tratorista'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormInput(label: 'Identificação do trator'),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tractorProblemsData.length,
              itemBuilder: (ctx, problem) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                child: FormCard(
                  title: tractorProblemsData.values.elementAt(problem).title,
                  cardNumber: tractorProblemsData.values.elementAt(problem).id,
                  image: tractorProblemsData.values.elementAt(problem).imageURL,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _createPDF,
                      child: Text("Salvar"),
                    ),
                  ),
                  FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Enviando os dados'),
                            backgroundColor: AppColors.darkPrimary));
                      }
                    },
                    label: const Text('Confirmar'),
                    icon: Icon(Icons.thumb_up),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _createPDF() async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawString(
    "CEFAT - CENTRO DE TREINAMENTO AGRÍCOLA FAMOSA",
    PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
    bounds: Rect.fromLTRB(50, 0, 0, 0),
  );

  // page.graphics.drawString("Nome:",
  //     PdfStandardFont(PdfFontFamily.courier, 10, style: PdfFontStyle.regular));

  List<int> bytes = document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Output.pdf');
}
