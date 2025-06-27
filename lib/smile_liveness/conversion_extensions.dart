import 'package:dot_face_core/dot_face_core.dart';
import 'package:dot_flutter_sdk_example/conversion_extensions.dart';

import '../face/conversion_extensions.dart';

extension SmileLivenessResultExt on SmileLivenessResult {
  Map<String, dynamic> toJson() {
    return {
      'bgrRawImage': bgrRawImage.toJson(),
      'face': face.toJson(),
      'content': content.toJson(),
    };
  }
}
