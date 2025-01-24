import 'package:intl/intl.dart';

DateFormat timeFormat = DateFormat.Hm('pt_BR');

String toDayFormat = DateFormat.MMMEd().format(DateTime.now());