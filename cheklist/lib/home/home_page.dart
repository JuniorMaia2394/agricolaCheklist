import 'package:cheklist/core/core.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/home/Widgets/card/form_card.dart';
import 'package:cheklist/home/Widgets/input/form_input.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormInput(title: "Nome do tratorista",),
            FormInput(title: "Identificação do trator",),
            FormCard(title: "Nível do Óleo"),
            FormCard(title: "Nível da água"),
          ],
        ),
      ),
    );
  }
}