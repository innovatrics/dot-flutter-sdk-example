import 'package:dot_face_core/dot_face_core.dart';
import 'package:dot_flutter_sdk_example/conversion_extensions.dart';

extension FaceDetectorFaceExt on FaceDetectorFace {
  Map<String, dynamic> toJson() {
    return {
      'confidence': confidence,
      'position': position.toJson(),
      'faceAspects': faceAspects.toJson(),
      'faceQuality': faceQuality.toJson(),
      'faceKeypoints': faceKeypoints.toJson(),
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

extension FaceAspectsExt on FaceAspects {
  Map<String, dynamic> toJson() {
    return {
      'eyeDistanceToImageShorterSideRatio': eyeDistanceToImageShorterSideRatio,
    };
  }
}

extension FaceQualityExt on FaceQuality {
  Map<String, dynamic> toJson() {
    return {
      'imageQuality': imageQuality.toJson(),
      'headPose': headPose.toJson(),
      'wearables': wearables.toJson(),
      'expression': expression.toJson(),
    };
  }
}

extension FaceImageQualityExt on FaceImageQuality {
  Map<String, dynamic> toJson() {
    return {
      'sharpness': sharpness?.toJson(),
      'brightness': brightness?.toJson(),
      'contrast': contrast?.toJson(),
      'uniqueIntensityLevels': uniqueIntensityLevels?.toJson(),
      'shadow': shadow?.toJson(),
      'specularity': specularity?.toJson(),
    };
  }
}

extension FaceAttributeExt on FaceAttribute {
  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'arePreconditionsMet': arePreconditionsMet,
    };
  }
}

extension HeadPoseExt on HeadPose {
  Map<String, dynamic> toJson() {
    return {
      'roll': roll?.toJson(),
      'yaw': yaw?.toJson(),
      'pitch': pitch?.toJson(),
    };
  }
}

extension HeadPoseAttributeExt on HeadPoseAttribute {
  Map<String, dynamic> toJson() {
    return {
      'angle': angle,
      'arePreconditionsMet': arePreconditionsMet,
    };
  }
}

extension WearablesExt on Wearables {
  Map<String, dynamic> toJson() {
    return {
      'glasses': glasses?.toJson(),
    };
  }
}

extension GlassesExt on Glasses {
  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'arePreconditionsMet': arePreconditionsMet,
    };
  }
}

extension ExpressionExt on Expression {
  Map<String, dynamic> toJson() {
    return {
      'eyes': eyes.toJson(),
      'mouth': mouth?.toJson(),
    };
  }
}

extension EyesExpressionExt on EyesExpression {
  Map<String, dynamic> toJson() {
    return {
      'rightEye': rightEye?.toJson(),
      'leftEye': leftEye?.toJson(),
    };
  }
}

extension FaceKeypointsExt on FaceKeypoints {
  Map<String, dynamic> toJson() {
    return {
      'rightEyeOuterCorner': rightEyeOuterCorner?.toJson(),
      'rightEyeCenter': rightEyeCenter?.toJson(),
      'rightEyeInnerCorner': rightEyeInnerCorner?.toJson(),
      'leftEyeInnerCorner': leftEyeInnerCorner?.toJson(),
      'leftEyeCenter': leftEyeCenter?.toJson(),
      'leftEyeOuterCorner': leftEyeOuterCorner?.toJson(),
      'noseRoot': noseRoot?.toJson(),
      'noseRightBottom': noseRightBottom?.toJson(),
      'noseTip': noseTip?.toJson(),
      'noseLeftBottom': noseLeftBottom?.toJson(),
      'noseBottom': noseBottom?.toJson(),
      'mouthRightCorner': mouthRightCorner?.toJson(),
      'mouthCenter': mouthCenter?.toJson(),
      'mouthLeftCorner': mouthLeftCorner?.toJson(),
      'mouthUpperEdge': mouthUpperEdge?.toJson(),
      'mouthLowerEdge': mouthLowerEdge?.toJson(),
      'rightEyebrowOuterEnd': rightEyebrowOuterEnd?.toJson(),
      'rightEyebrowInnerEnd': rightEyebrowInnerEnd?.toJson(),
      'leftEyebrowInnerEnd': leftEyebrowInnerEnd?.toJson(),
      'leftEyebrowOuterEnd': leftEyebrowOuterEnd?.toJson(),
      'rightEdge': rightEdge?.toJson(),
      'chinTip': chinTip?.toJson(),
      'leftEdge': leftEdge?.toJson(),
    };
  }
}

extension FaceKeypointExt on FaceKeypoint {
  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'score': score,
    };
  }
}

extension TemplateExt on Template {
  Map<String, dynamic> toJson() {
    return {
      'bytes': bytes.toJson(),
      'version': version,
    };
  }
}
