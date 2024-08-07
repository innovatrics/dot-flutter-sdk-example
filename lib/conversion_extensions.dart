import 'dart:typed_data';
import 'package:dot_nfc/dot_nfc.dart';
import 'package:dot_core/dot_core.dart';

extension Uint8ListExt on Uint8List {
  String toJson() {
    return '${length} bytes';
  }
}

extension ImageExt on Image {
  Map<String, dynamic> toJson() {
    return {
      'format': format.name,
      'size': size.toJson(),
      'bytes': bytes.toJson(),
    };
  }
}

extension ImageSizeExt on ImageSize {
  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
    };
  }
}

extension PointDoubleExt on PointDouble {
  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y};
  }
}
