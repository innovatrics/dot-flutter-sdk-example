import 'package:dot_face_lite/dot_face_lite.dart';

import '../face/conversion_extensions.dart';

extension FaceAutoCaptureResultExt on FaceAutoCaptureResult {
  Map<String, dynamic> toJson() {
    return {
      'bgraRawImage': {
        'bytes': '${bgraRawImage.bytes.length} bytes',
        'size': {
          'width': bgraRawImage.size.width,
          'height': bgraRawImage.size.height,
        },
      },
      'faceDetectorResult': {
        'confidence': faceDetectorResult.confidence,
        'normalizedRectangle': faceDetectorResult.normalizedRectangle?.toJson(),
        'imageParameters': faceDetectorResult.imageParameters?.toJson(),
      },
      'content': '${content.length} bytes',
    };
  }
}
