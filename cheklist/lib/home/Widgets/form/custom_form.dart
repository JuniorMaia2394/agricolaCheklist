import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:cheklist/errors/errorMessages.dart';
import 'package:cheklist/home/Widgets/dialog/custom_dialog.dart';
import 'package:cheklist/errors/error_dialog.dart';
import 'package:cheklist/home/Widgets/input/form_input_id.dart';
import 'package:cheklist/home/Widgets/input/form_input_name.dart';
import 'package:cheklist/home/Widgets/card/form_card.dart';
import 'package:cheklist/models/tractor_problem.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm> {
  final tractorProblemsData = {...tractorProblems};
  final _formKey = GlobalKey<FormState>();
  final _name = new TextEditingController();
  final _tractorId = new TextEditingController();

  var uncheckedCardBorder = AppColors.alert;

  @override
  Widget build(BuildContext context) {
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
                  maxLength: 7),
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
                  FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      final isCardsValidated = cardsValidation(tractorProblemsData);
                      var errorMessage;

                      RegExp tractorIdValidator =
                          new RegExp(r"^(AF|AL)-[0-9]{4}$");

                      Iterable<Match> matches =
                          tractorIdValidator.allMatches(_tractorId.text);
                          
                      if (!_formKey.currentState.validate()
                          && matches.length == 0
                          && !isCardsValidated
                      ) {
                        errorMessage = errorMessages['1'];
                      } 
                      else if (
                        !_formKey.currentState.validate()
                        || matches.length == 0
                      ) {
                        errorMessage = errorMessages['2'];
                      }
                      else if (!isCardsValidated) {
                        errorMessage = errorMessages['3'];
                      }

                      if (_formKey.currentState.validate()
                          && matches.length > 0
                          && isCardsValidated
                        ) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Enviando os dados...'),
                            backgroundColor: AppColors.darkPrimary));
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(
                                fieldName: _name.text,
                                fieldTractorIdentification: _tractorId.text,
                              );
                            });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Erro no envio dos dados!'),
                            backgroundColor: AppColors.darkDanger));
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorDialog(
                                errorMessage: errorMessage,
                              );
                            });
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

bool cardsValidation(Map <String,TractorProblem>tractorProblems) {
  for (
    var tractorProblemIndex = 1;
    tractorProblemIndex < tractorProblems.length;
    tractorProblemIndex++
  ) {
    print(tractorProblems.values.elementAt(tractorProblemIndex).isValid);
    if (!tractorProblems.values.elementAt(tractorProblemIndex).isValid) {
      return false;
    }
  }
  return true;
}