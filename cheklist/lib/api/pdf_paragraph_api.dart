import 'dart:io';
import 'dart:ui';

import 'package:cheklist/api/pdf_api.dart';
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
          Header(
            child: Text(
              'CEFAT - CENTRO DE TREINAMENTO AGRÍCOLA FAMOSA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Paragraph(
            text: "Nome:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Paragraph(
            text: "Prefixo Trator:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Paragraph(
            text: "Nível de óleo:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Paragraph(
            text: "Nível da Água: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
}
