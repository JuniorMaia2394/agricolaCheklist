import 'package:flutter/cupertino.dart';

class TractorProblem {
  String id;
  String title;
  String imageURL;
  String status;

  TractorProblem({
    @required this.id,
    @required this.title,
    @required this.imageURL,
    @required this.status,
  });

  void updateStatus(String value ) {
    this.status = value;
  }
}
