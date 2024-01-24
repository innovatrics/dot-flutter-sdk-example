import 'dart:convert';

import 'package:dot_document/dot_document.dart';
import 'package:dot_flutter_sdk_example/conversion_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DocumentAutoCaptureResultScreen extends StatelessWidget {
  final DocumentAutoCaptureResult _result;

  late final Future<RawImage> _image;

  DocumentAutoCaptureResultScreen(this._result) {
    this._image = getImageFromResult(_result);
  }

  @override
  Widget build(BuildContext context) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String jsonText = encoder.convert(_result.toJson());

    return Scaffold(
      appBar: AppBar(
        title: Text('Document Auto Capture Result'),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
            width: double.infinity,
            child: FutureBuilder(
                future: _image,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.requireData;
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
        Container(
            width: double.infinity,
            child: Text(jsonText, style: TextStyle(fontSize: 12)))
      ])),
    );
  }

  Future<RawImage> getImageFromResult(DocumentAutoCaptureResult result) async {
    final uiImage = await ImageFactory.create(result.bgraRawImage);
    return _DisposableRawImage(
        image: uiImage, color: Colors.black, colorBlendMode: BlendMode.dstOver);
  }
}

final class _DisposableRawImage extends RawImage {
  const _DisposableRawImage(
      {super.key, super.image, super.color, super.colorBlendMode});

  @override
  void didUnmountRenderObject(RenderImage renderObject) {
    image?.dispose();
    super.didUnmountRenderObject(renderObject);
  }
}
