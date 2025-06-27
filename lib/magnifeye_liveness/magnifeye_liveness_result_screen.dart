import 'dart:convert';

import 'package:dot_face_core/dot_face_core.dart';
import 'package:flutter/material.dart';

import '../disposable_raw_image.dart';
import '../json_encoder_factory.dart';
import 'conversion_extensions.dart';

class MagnifEyeLivenessResultScreen extends StatelessWidget {
  final MagnifEyeLivenessResult result;

  late final Future<RawImage> _image;

  MagnifEyeLivenessResultScreen({
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
        title: Text('MagnifEye Liveness Result'),
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

  Future<RawImage> getImageFromResult(MagnifEyeLivenessResult result) async {
    final uiImage =
        await ImageFactory.createFromBgrRawImage(result.bgrRawImage);
    return DisposableRawImage(
      image: uiImage,
      color: Colors.black,
      colorBlendMode: BlendMode.dstOver,
    );
  }
}
