import 'dart:convert';

class JsonEncoderFactory {
  static const jsonIndent = '  ';

  static JsonEncoder create() {
    return const JsonEncoder.withIndent(jsonIndent);
  }
}
