import 'package:dot_face_lite/dot_face_lite.dart';

extension RectangleDoubleFaceExt on RectangleDouble {
  Map<String, dynamic> toJson() {
    return {
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
    };
  }
}

extension ImageParametersFaceExt on ImageParameters {
  Map<String, dynamic> toJson() {
    return {
      'brightness': brightness,
      'sharpness': sharpness,
    };
  }
}
