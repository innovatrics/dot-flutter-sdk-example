import 'package:dot_document/dot_document.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'nfc_reading_screen.dart';

class NfcKeyCaptureScreen extends StatelessWidget {
  const NfcKeyCaptureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Key Capture'),
      ),
      body: DocumentAutoCaptureWidget(
        configuration: _createDocumentAutoCaptureConfiguration(),
        onCreated: (controller) => controller.start(),
        onCaptured: (result) => Navigator.of(context).pushReplacement(
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
      mrzValidation: MrzValidation.validateAlways,
    );
  }
}
