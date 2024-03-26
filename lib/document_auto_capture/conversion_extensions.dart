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
      'documentDetectorResult': {
        'confidence': documentDetectorResult.confidence,
        'corners': documentDetectorResult.corners.toJson(),
        'widthToHeightRatio': documentDetectorResult.widthToHeightRatio
      },
      'imageParameters': imageParameters.toJson()
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

extension CornersExt on Corners {
  Map<String, dynamic> toJson() {
    return {
      'bottomLeft': bottomLeft.toJson(),
      'bottomRight': bottomRight.toJson(),
      'topLeft': topLeft.toJson(),
      'topRight': topRight.toJson()
    };
  }
}

extension PointDoubleExt on PointDouble {
  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y};
  }
}
