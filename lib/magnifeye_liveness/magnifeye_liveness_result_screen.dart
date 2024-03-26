import 'dart:convert';

import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:flutter/material.dart';

import '../disposable_raw_image.dart';
import '../json_encoder_factory.dart';
import '../magnifeye_liveness/conversion_extensions.dart';

class MagnifEyeLivenessResultScreen extends StatelessWidget {
  final MagnifEyeLivenessResult _result;

  late final Future<RawImage> _image;

  MagnifEyeLivenessResultScreen(this._result) {
    this._image = getImageFromResult(_result);
  }

  @override
  Widget build(BuildContext context) {
    JsonEncoder jsonEncoder = JsonEncoderFactory.create();
    String jsonText = jsonEncoder.convert(_result.toJson());

    return Scaffold(
      appBar: AppBar(
        title: Text('MagnifEye Liveness Result'),
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

  Future<RawImage> getImageFromResult(MagnifEyeLivenessResult result) async {
    final uiImage = await ImageFactory.create(result.bgraRawImage);
    return DisposableRawImage(
        image: uiImage, color: Colors.black, colorBlendMode: BlendMode.dstOver);
  }
}
