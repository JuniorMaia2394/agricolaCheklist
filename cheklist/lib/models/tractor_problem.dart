import 'package:flutter/cupertino.dart';

class TractorProblem {
  String id;
  String title;
  String imageURL;
  String status;
  bool isValid = false;

  TractorProblem({
    @required this.id,
    @required this.title,
    @required this.imageURL,
    @required this.status,
    this.isValid
  });

  void updateStatus(String value) {
    this.status = value;
    setValid();
  }

  void setValid() {
    this.isValid = true;
  }
}
