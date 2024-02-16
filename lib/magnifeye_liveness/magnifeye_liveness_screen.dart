import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'magnifeye_liveness_result_screen.dart';

class MagnifEyeLivenessScreen extends StatefulWidget {
  @override
  State createState() => _MagnifEyeLivenessScreen();
}

class _MagnifEyeLivenessScreen extends State<MagnifEyeLivenessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MagnifEye Liveness'),
        ),
        body: MagnifEyeLivenessWidget(
          configuration: MagnifEyeLivenessConfiguration(),
          onCreated: (controller) {
            debugPrint(
                "on created called, starting MagnifEye liveness evaluation");
            controller.start();
          },
          onProcessed: (detection) => debugPrint("on processed called"),
          onFinished: (result) {
            Navigator.of(context).pushReplacement(
                createRoute(MagnifEyeLivenessResultScreen(result)));
          },
          onStopped: () => debugPrint("on stopped called"),
        ));
  }
}
