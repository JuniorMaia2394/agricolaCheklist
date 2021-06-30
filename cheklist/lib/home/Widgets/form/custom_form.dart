import 'package:cheklist/api/pdf_api.dart';
import 'package:cheklist/api/pdf_paragraph_api.dart';
import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:cheklist/home/Widgets/button/xls_button.dart';
import 'package:cheklist/home/Widgets/input/form_input_id.dart';
import 'package:cheklist/home/Widgets/input/form_input_name.dart';
import 'package:cheklist/home/Widgets/card/form_card.dart';
import 'package:flutter/material.dart';

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
  final _name = new TextEditingController();
  final _tractorId = new TextEditingController();

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
              child: FormInputName(
                label: 'Nome do tratorista',
                maxLength: 40,
                nameController: _name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormInputId(
                label: 'Identificação do trator',
                tractorIdController: _tractorId,
                maxLength: 7
              ),
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
                      onPressed: () async {
                        final pdfFile = await PdfParagraphApi.generate();

                        PdfApi.openFile(pdfFile);
                      },
                      child: Text("Salvar"),
                    ),
                  ),
                  FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      RegExp tractorIdValidator = new RegExp(r"^(AF|AL)-[0-9]{4}$");
                      Iterable<Match> matches = tractorIdValidator.allMatches(_tractorId.text);

                      if (_formKey.currentState.validate() && matches.length > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Enviando os dados...'),
                            backgroundColor: AppColors.darkPrimary));
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return AlertDialog(
                              content: Column( children: [
                                Text('name: ' + _name.text),
                                Text('Identificação: ' + _tractorId.text),
                                XlsButton(
                                  label: 'Gerar planilha',
                                  fileName: 'TractorProblemsRecord',
                                  fieldName: _name.text,
                                  fieldTractorIdentification: _tractorId.text
                                )
                              ],
                            )
                           );
                          }
                        );
                      }
                      else if (!_formKey.currentState.validate() || matches.length == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Erro no envio dos dados!'),
                            backgroundColor: AppColors.darkDanger));
                      }
                    },
                    label: const Text('Confirmar'),
                    icon: Icon(Icons.thumb_up),
                  ),
                  // XlsButton(
                  //   label: 'Gerar planilha',
                  //   fileName: 'TractorProblemsRecord',
                  //   fieldName: _name.text,
                  //   fieldTractorIdentification: _tractorId.text
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
