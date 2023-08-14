import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class EndpointEnv {
  // load the env
  static Future<void> init() async {
    await dotenv.load(fileName: 'env/.env').then((_) async {
      Logger().i('Active env ${dotenv.env['ACTIVE']}');
      await dotenv.load(fileName: '${dotenv.env['ACTIVE']}').then((_) {
        Logger().i('Environment loaded');
      });
    });
  }
}
