import 'dart:ui';

import 'package:cheklist/data/tractor_problems.dart';
import 'package:cheklist/home/Widgets/card/card_full.dart';
import 'package:cheklist/home/home_state.dart';
import 'package:cheklist/models/tractor_problem.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/core/core.dart';

class FormCard extends StatelessWidget {
  final String title;
  final String cardNumber;

  const FormCard({
    Key key,
    this.title,
    this.cardNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardFull();
  }
}
