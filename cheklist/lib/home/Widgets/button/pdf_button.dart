import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:flutter/material.dart';
import 'package:cheklist/api/pdf_api.dart';
import 'package:cheklist/api/pdf_template.dart';

class PdfButton extends StatefulWidget {
  final String label;
  final String fileName;
  final String fieldName;
  final String fieldTractorIdentification;

  const PdfButton({
    Key key,    
    @required this.label,
    @required this.fileName,
    @required this.fieldName,
    @required this.fieldTractorIdentification
  }) : super(key: key);

  @override
  PdfButtonState createState() {
    return PdfButtonState();
  }
}

class PdfButtonState extends State<PdfButton> {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(12),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () async {
        final pdfFile = await PdfTemplate
          .generate(
            widget.fieldName, 
            widget.fieldTractorIdentification,
            widget.fileName
          );

        PdfApi.openFile(pdfFile);
      },
      child: Text(widget.label),      
    );
  }
}
