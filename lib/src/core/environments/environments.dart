import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentsImpl {
  bool _debugMode = false;
  void devEnvironment() {
    _debugMode = dotenv.env['DEBUG_MODE'] == 'true';
  }

  
  void prodEnvironment() {
  }

  bool get debugMode => _debugMode;
}
