import 'package:dot_document/dot_document.dart';
import 'package:dot_flutter_sdk_example/conversion_extensions.dart';

extension DocumentAutoCaptureResultExt on DocumentAutoCaptureResult {
  Map<String, dynamic> toJson() {
    return {
      'image': image.toJson(),
      'document': document?.toJson(),
      'content': content.toJson(),
    };
  }
}

extension DocumentDetectorDocumentExt on DocumentDetectorDocument {
  Map<String, dynamic> toJson() {
    return {
      'confidence': confidence,
      'position': position.toJson(),
      'widthToHeightRatio': widthToHeightRatio,
      'quality': quality.toJson(),
    };
  }
}

extension DetectionPositionExt on DetectionPosition {
  Map<String, dynamic> toJson() {
    return {
      'topLeft': topLeft.toJson(),
      'topRight': topRight.toJson(),
      'bottomRight': bottomRight.toJson(),
      'bottomLeft': bottomLeft.toJson(),
    };
  }
}

extension DocumentQualityExt on DocumentQuality {
  Map<String, dynamic> toJson() {
    return {
      'imageQuality': imageQuality.toJson(),
    };
  }
}

extension DocumentImageQualityExt on DocumentImageQuality {
  Map<String, dynamic> toJson() {
    return {
      'brightness': brightness,
      'sharpness': sharpness,
      'hotspotsScore': hotspotsScore,
    };
  }
}
