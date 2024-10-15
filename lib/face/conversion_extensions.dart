import 'package:dot_flutter_sdk_example/conversion_extensions.dart';
import 'package:dot_face_lite/dot_face_lite.dart';

extension ImageParametersFaceExt on ImageParameters {
  Map<String, dynamic> toJson() {
    return {
      'brightness': brightness,
      'sharpness': sharpness,
    };
  }
}

extension DetectionPositionExt on DetectionPosition {
  Map<String, dynamic> toJson() {
    return {
      'center': center.toJson(),
      'sizeToImageShorterSideRatio': sizeToImageShorterSideRatio,
    };
  }
}
