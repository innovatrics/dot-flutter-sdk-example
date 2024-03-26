import 'dart:convert';

import 'package:dot_flutter_sdk_example/nfc_reading/conversion_extensions.dart';
import 'package:dot_nfc/dot_nfc.dart';
import 'package:flutter/material.dart';

import '../json_encoder_factory.dart';

class NfcReadingResultScreen extends StatelessWidget {
  final TravelDocument travelDocument;

  const NfcReadingResultScreen({
    required this.travelDocument,
  });

  @override
  Widget build(BuildContext context) {
    JsonEncoder jsonEncoder = JsonEncoderFactory.create();
    String jsonText = jsonEncoder.convert(travelDocument.toJson());
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Reading Result'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(jsonText, style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
