import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:cheklist/home/Widgets/input/form_input.dart';
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
                        title:
                            tractorProblemsData.values.elementAt(problem).title,
                        cardNumber:
                            tractorProblemsData.values.elementAt(problem).id,
                        image: tractorProblemsData.values
                            .elementAt(problem)
                            .imageURL,
                      ),
                    )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: FloatingActionButton.extended(
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
            ),
          ],
        ),
      ),
    );
  }
}
