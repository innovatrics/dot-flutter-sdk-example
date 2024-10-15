import 'package:flutter/material.dart';

class NfcReadingErrorScreen extends StatelessWidget {
  final String message;

  const NfcReadingErrorScreen({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Reading Error'),
      ),
      body: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
