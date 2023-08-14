// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetConst {
  static String? get MY_ENGINE => dotenv.env['MY_ENGINE'];
}
