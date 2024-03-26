import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:dot_flutter_sdk_example/conversion_extensions.dart';

import '../face/conversion_extensions.dart';

extension MagnifEyeLivenessResultExt on MagnifEyeLivenessResult {
  Map<String, dynamic> toJson() {
    return {
      'bgraRawImage': {
        'bytes': bgraRawImage.bytes.toJson(),
        'size': bgraRawImage.size.toJson(),
      },
      'faceDetectorResult': {
        'confidence': faceDetectorResult.confidence,
        'normalizedRectangle': faceDetectorResult.normalizedRectangle?.toJson(),
        'imageParameters': faceDetectorResult.imageParameters?.toJson(),
      },
      'content': content.toJson(),
    };
  }
}
