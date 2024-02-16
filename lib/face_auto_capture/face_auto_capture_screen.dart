import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'face_auto_capture_result_screen.dart';

class FaceAutoCaptureScreen extends StatefulWidget {
  @override
  State createState() => _FaceAutoCaptureScreen();
}

class _FaceAutoCaptureScreen extends State<FaceAutoCaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Face Auto Capture'),
        ),
        body: FaceAutoCaptureWidget(
          configuration: FaceAutoCaptureConfiguration(),
          onCreated: (controller) {
            debugPrint("on created called, starting face auto capture");
            controller.start();
          },
          onCandidateSelectionStarted: () =>
              debugPrint("on candidate selection started called"),
          onProcessed: (detection) => debugPrint("on processed called"),
          onCaptured: (result) {
            Navigator.of(context).pushReplacement(
                createRoute(FaceAutoCaptureResultScreen(result)));
          },
          onStopped: () => debugPrint("on stopped called"),
        ));
  }
}
