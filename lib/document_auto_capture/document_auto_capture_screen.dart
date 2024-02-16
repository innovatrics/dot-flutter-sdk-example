import 'package:dot_document/dot_document.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'document_auto_capture_result_screen.dart';

class DocumentAutoCaptureScreen extends StatefulWidget {
  @override
  State createState() => _DocumentAutoCaptureScreen();
}

class _DocumentAutoCaptureScreen extends State<DocumentAutoCaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Document Auto Capture'),
        ),
        body: DocumentAutoCaptureWidget(
          configuration: DocumentAutoCaptureConfiguration(),
          onCreated: (controller) {
            debugPrint("on created called, starting document auto capture");
            controller.start();
          },
          onCandidateSelectionStarted: () =>
              debugPrint("on candidate selection started called"),
          onProcessed: (detection) => debugPrint("on processed called"),
          onCaptured: (result) {
            Navigator.of(context).pushReplacement(
                createRoute(DocumentAutoCaptureResultScreen(result)));
          },
          onStopped: () => debugPrint("on stopped called"),
        ));
  }
}
