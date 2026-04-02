import 'package:dot_face_core/dot_face_core.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'magnifeye_liveness_result_screen.dart';

class MagnifEyeLivenessScreen extends StatelessWidget {
  const MagnifEyeLivenessScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MagnifEye Liveness'),
      ),
      body: MagnifEyeLivenessWidget(
        configuration: MagnifEyeLivenessWidgetConfiguration(),
        onCreated: (controller) => controller.start(),
        onFinished: (result) => Navigator.of(context).pushReplacement(
          createRoute(
            MagnifEyeLivenessResultScreen(result: result),
          ),
        ),
      ),
    );
  }
}
