import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'face_auto_capture_result_screen.dart';

class FaceAutoCaptureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Face Auto Capture'),
        ),
        body: FaceAutoCaptureWidget(
          configuration: FaceAutoCaptureConfiguration(),
          onCreated: (controller) => controller.start(),
          onCaptured: (result) => Navigator.of(context).pushReplacement(
              createRoute(FaceAutoCaptureResultScreen(result))),
        ));
  }
}
