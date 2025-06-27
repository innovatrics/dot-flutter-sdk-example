import 'dart:convert';

import 'package:dot_document/dot_document.dart';
import 'package:flutter/material.dart';

import '../disposable_raw_image.dart';
import '../json_encoder_factory.dart';
import 'conversion_extensions.dart';

class DocumentAutoCaptureResultScreen extends StatelessWidget {
  final DocumentAutoCaptureResult result;

  late final Future<RawImage> _image;

  DocumentAutoCaptureResultScreen({
    super.key,
    required this.result,
  }) {
    _image = getImageFromResult(result);
  }

  @override
  Widget build(BuildContext context) {
    JsonEncoder jsonEncoder = JsonEncoderFactory.create();
    String jsonText = jsonEncoder.convert(result.toJson());

    return Scaffold(
      appBar: AppBar(
        title: Text('Document Auto Capture Result'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FutureBuilder(
                future: _image,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.requireData;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(jsonText, style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Future<RawImage> getImageFromResult(DocumentAutoCaptureResult result) async {
    final uiImage =
        await ImageFactory.createFromBgraRawImage(result.bgraRawImage);
    return DisposableRawImage(
      image: uiImage,
      color: Colors.black,
      colorBlendMode: BlendMode.dstOver,
    );
  }
}
