import 'package:cheklist/home/Widgets/card/card_full.dart';
import 'package:flutter/material.dart';

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
