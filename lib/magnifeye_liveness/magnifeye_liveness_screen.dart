import 'package:dot_face_lite/dot_face_lite.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'magnifeye_liveness_result_screen.dart';

class MagnifEyeLivenessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MagnifEye Liveness'),
        ),
        body: MagnifEyeLivenessWidget(
          configuration: MagnifEyeLivenessConfiguration(),
          onCreated: (controller) => controller.start(),
          onFinished: (result) => Navigator.of(context).pushReplacement(
              createRoute(MagnifEyeLivenessResultScreen(result))),
        ));
  }
}
