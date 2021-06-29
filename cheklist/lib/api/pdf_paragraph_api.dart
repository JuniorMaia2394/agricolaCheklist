import 'dart:io';
import 'dart:ui';

import 'package:cheklist/api/pdf_api.dart';
import 'package:cheklist/data/tractor_problems.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfParagraphApi {
  static Future<File> generate() async {
    final pdf = Document();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy , kk:mm').format(now);

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          Text('Data: $formattedDate'),
          SizedBox(height: 8),
          buildTtitle(),
          Divider(),
          Paragraph(
            text: 'NOME TRATORISTA: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Paragraph(
            text: 'PREFIXO TRATOR: ',
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

    return PdfApi.saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Widget buildTtitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CEFAT - CENTRO DE TREINAMENTO AGRÍCOLA FAMOSA',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      );

  static buildTable() {
    final headers = ['ID', 'DESCRIÇÃO', 'STATUS'];

    final data = TRACTOR_PROBLEMS.values.toList();

    return Table.fromTextArray(
      headers: headers,
      data: data
          .map((tractor) => [tractor.id, tractor.title, tractor.imageURL])
          .toList(),
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellPadding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.center,
      },
    );
  }
}
