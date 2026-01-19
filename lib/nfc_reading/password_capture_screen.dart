import 'package:dot_document/dot_document.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'nfc_reading_screen.dart';

class PasswordCaptureScreen extends StatelessWidget {
  const PasswordCaptureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Capture'),
      ),
      body: DocumentAutoCaptureWidget(
        configuration: _createDocumentAutoCaptureConfiguration(),
        onCreated: (controller) => controller.start(),
        onFinished: (result) => Navigator.of(context).pushReplacement(
          createRoute(
            NfcReadingScreen(
              machineReadableZone: result.machineReadableZone!,
            ),
          ),
        ),
      ),
    );
  }

  DocumentAutoCaptureConfiguration _createDocumentAutoCaptureConfiguration() {
    return DocumentAutoCaptureConfiguration(
      base: BaseDocumentAutoCaptureConfiguration(
        mrzValidation: MrzValidation.requirePresenceAndValidity,
      ),
    );
  }
}
