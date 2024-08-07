import 'package:dot_document/dot_document.dart';
import 'package:dot_flutter_sdk_example/conversion_extensions.dart';

extension DocumentAutoCaptureResultExt on DocumentAutoCaptureResult {
  Map<String, dynamic> toJson() {
    return {
      'bgraRawImage': {
        'bytes': bgraRawImage.bytes.toJson(),
        'size': bgraRawImage.size.toJson(),
      },
      'content': content.toJson(),
      'document': {
        'confidence': document?.confidence,
        'position': document?.position?.toJson(),
        'widthToHeightRatio': document?.widthToHeightRatio,
        'imageParameters': document?.imageParameters?.toJson()
      }
    };
  }
}

extension ImageParametersExt on ImageParameters {
  Map<String, dynamic> toJson() {
    return {
      'brightness': brightness,
      'sharpness': sharpness,
      'hotspotsScore': hotspotsScore
    };
  }
}

extension DetectionPositionExt on DetectionPosition {
  Map<String, dynamic> toJson() {
    return {
      'bottomLeft': bottomLeft.toJson(),
      'bottomRight': bottomRight.toJson(),
      'topLeft': topLeft.toJson(),
      'topRight': topRight.toJson()
    };
  }
}
