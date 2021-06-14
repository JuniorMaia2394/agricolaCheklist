import 'package:cheklist/core/app_text_styles.dart';
import 'package:cheklist/core/core.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/home/Widgets/form/custom_form.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.primary,
      ),
      body: CustomForm()
    );
  }
}
