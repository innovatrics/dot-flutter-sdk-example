import 'dart:convert';

import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:flutter/material.dart';

import '../disposable_raw_image.dart';
import '../face_auto_capture/conversion_extensions.dart';
import '../json_encoder_factory.dart';

class FaceAutoCaptureResultScreen extends StatelessWidget {
  final FaceAutoCaptureResult result;

  late final Future<RawImage> _image;

  FaceAutoCaptureResultScreen({
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
        title: Text('Face Auto Capture Result'),
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

  Future<RawImage> getImageFromResult(FaceAutoCaptureResult result) async {
    final uiImage = await ImageFactory.create(result.bgraRawImage);
    return DisposableRawImage(
      image: uiImage,
      color: Colors.black,
      colorBlendMode: BlendMode.dstOver,
    );
  }
}
