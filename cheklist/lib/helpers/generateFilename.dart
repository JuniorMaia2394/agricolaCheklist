import 'package:intl/intl.dart';

String generateFilename(String originalFilename) {
  final DateTime now = DateTime.now();
  String formattedDate = DateFormat('ddMMyyyy').format(now);
  String formattedHour = DateFormat('kkmm').format(now);
  String filename = '${originalFilename}_${formattedDate + formattedHour}';

  return filename;
}