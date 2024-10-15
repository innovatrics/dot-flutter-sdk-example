import 'package:dot_document/dot_document.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'document_auto_capture_result_screen.dart';

class DocumentAutoCaptureScreen extends StatelessWidget {
  const DocumentAutoCaptureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Auto Capture'),
      ),
      body: DocumentAutoCaptureWidget(
        configuration: DocumentAutoCaptureConfiguration(),
        onCreated: (controller) => controller.start(),
        onCaptured: (result) => Navigator.of(context).pushReplacement(
          createRoute(DocumentAutoCaptureResultScreen(result: result)),
        ),
      ),
    );
  }
}
