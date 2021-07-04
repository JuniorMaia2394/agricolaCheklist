import 'dart:io';
import 'dart:ui';

import 'package:cheklist/api/pdf_api.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:cheklist/helpers/generateFilename.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfTemplate {
  final fileName;
  final name;
  final prefixtrat;

  const PdfTemplate(
      {final this.name, final this.prefixtrat, final this.fileName});

  static Future<File> generate(name, prefixTrat, fileName) async {
    final pdf = Document();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    String formattedHour = DateFormat('HH:mm').format(now);
    String generatedFilename = generateFilename(fileName);


    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          Text('Data: $formattedDate'),
          Text('Hora: $formattedHour'),
          SizedBox(height: 8),
          buildTtitle(),
          Divider(),
          Paragraph(
            text: 'Nome do tratorista: $name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Paragraph(
            text: 'Prefixo trator: $prefixTrat',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          buildTable(),
        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );

    return PdfApi.saveDocument(name: '$generatedFilename.pdf', pdf: pdf);
  }

  static Widget buildTtitle() => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'CETAF - Centro de Treinamento Agrícola Famosa',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  static buildTable() {
    final headers = ['ID', 'DESCRIÇÃO', 'STATUS'];

    final data = tractorProblems.values.toList();

    return Table.fromTextArray(
      headers: headers,
      data: data
          .map((tractor) => [tractor.id, tractor.title, tractor.status])
          .toList(),
      border: const TableBorder(
        verticalInside: BorderSide(),
      ),
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellPadding: EdgeInsets.symmetric(horizontal: 10),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
      },
    );
  }
}
