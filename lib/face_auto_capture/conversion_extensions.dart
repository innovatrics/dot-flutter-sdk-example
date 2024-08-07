import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:dot_flutter_sdk_example/conversion_extensions.dart';

import '../face/conversion_extensions.dart';

extension FaceAutoCaptureResultExt on FaceAutoCaptureResult {
  Map<String, dynamic> toJson() {
    return {
      'bgraRawImage': {
        'bytes': bgraRawImage.bytes.toJson(),
        'size': bgraRawImage.size.toJson(),
      },
      'face': {
        'confidence': face?.confidence,
        'position': face?.position?.toJson(),
        'imageParameters': face?.imageParameters?.toJson(),
      },
      'content': content.toJson(),
    };
  }
}
