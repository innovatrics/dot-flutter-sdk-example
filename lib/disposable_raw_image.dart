import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

final class DisposableRawImage extends RawImage {
  const DisposableRawImage({
    super.key,
    super.image,
    super.color,
    super.colorBlendMode,
  });

  @override
  void didUnmountRenderObject(RenderImage renderObject) {
    image?.dispose();
    super.didUnmountRenderObject(renderObject);
  }
}
