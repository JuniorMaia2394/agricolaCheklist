import 'package:cheklist/core/app_colors.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:cheklist/helpers/generateFilename.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'dart:convert';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;

class XlsButton extends StatefulWidget {
  final String label;
  final String fileName;
  final String fieldName;
  final String fieldTractorIdentification;

  const XlsButton(
      {Key key,
      @required this.label,
      @required this.fileName,
      @required this.fieldName,
      @required this.fieldTractorIdentification})
      : super(key: key);

  @override
  XlsButtonState createState() {
    return XlsButtonState();
  }
}

class XlsButtonState extends State<XlsButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(12.0),
        primary: AppColors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: createExcel,
      child: Text(widget.label),
    );
  }

  Future<void> createExcel() async {
    final data = tractorProblems;

    final generatedFilename = generateFilename(widget.fileName);

    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    String formattedHour = DateFormat('HH:mm').format(now);

    sheet.getRangeByName('A1').setText('Nome do tratorista');
    sheet.getRangeByName('A2').setText(widget.fileName);

    sheet.getRangeByName('B1').setText('Identificação do trator');
    sheet.getRangeByName('B2').setText(widget.fieldTractorIdentification);

    sheet.getRangeByName('A4').setText('Id');
    for (var row = 0; row < data.length; row++) {
      var sheetRow = row + 5;
      sheet.getRangeByName('A$sheetRow').setText(data.values.elementAt(row).id);
    }

    sheet.getRangeByName('B4').setText('Descrição');
    for (var row = 0; row < data.length; row++) {
      var sheetRow = row + 5;
      sheet
          .getRangeByName('B$sheetRow')
          .setText(data.values.elementAt(row).title);
    }

    sheet.getRangeByName('C4').setText('Status');
    for (var row = 0; row < data.length; row++) {
      var sheetRow = row + 5;
      sheet
          .getRangeByName('C$sheetRow')
          .setText(data.values.elementAt(row).status);
    }

    sheet.getRangeByName('E1').setText('Data de criação');
    sheet.getRangeByName('E2').setText('$formattedDate');
    sheet.getRangeByName('F1').setText('hora de criação');
    sheet.getRangeByName('F2').setText('$formattedHour');
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
        href: 'data:application/octet-stream;charset-utf-161e;base64,${base64.encode(bytes)}' 
      )..setAttribute('download', '$generatedFilename.xlsx')
      ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName = Platform.isWindows ? '$path\\$generatedFilename.xlsx' : '$path/$generatedFilename.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }
}
