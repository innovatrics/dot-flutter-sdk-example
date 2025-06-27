import 'package:dot_face_core/dot_face_core.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'smile_liveness_result_screen.dart';

class SmileLivenessScreen extends StatelessWidget {
  const SmileLivenessScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smile Liveness'),
      ),
      body: SmileLivenessWidget(
        configuration: SmileLivenessConfiguration(),
        onCreated: (controller) => controller.start(),
        onFinished: (result) => Navigator.of(context).pushReplacement(
          createRoute(
            SmileLivenessResultScreen(result: result),
          ),
        ),
      ),
    );
  }
}
