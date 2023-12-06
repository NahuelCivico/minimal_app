import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get baseUrl {
    return dotenv.get('API_BASE_URL');
  }
}
