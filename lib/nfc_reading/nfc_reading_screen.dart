import 'dart:io';

import 'package:dot_document/dot_document.dart';
import 'package:dot_nfc/dot_nfc.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import '../progress_widget.dart';
import 'nfc_key_factory.dart';
import 'nfc_reading_error_screen.dart';
import 'nfc_reading_result_screen.dart';
import 'resolve_authority_certificates_file_use_case.dart';

class NfcReadingScreen extends StatefulWidget {
  final MachineReadableZone machineReadableZone;

  NfcReadingScreen({required this.machineReadableZone});

  @override
  State<NfcReadingScreen> createState() => _NfcReadingScreenState();
}

class _NfcReadingScreenState extends State<NfcReadingScreen> {
  late final Future<File> _authorityCertificatesFile;

  @override
  void initState() {
    super.initState();
    _authorityCertificatesFile =
        ResolveAuthorityCertificatesFileUseCase().resolve(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Reading'),
      ),
      body: Center(child: _createFutureNfcTravelDocumentReaderWidget()),
    );
  }

  Widget _createFutureNfcTravelDocumentReaderWidget() {
    return FutureBuilder(
      future: _authorityCertificatesFile,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _createNfcTravelDocumentReaderWidget(snapshot.data!.path);
        } else {
          return const ProgressWidget();
        }
      },
    );
  }

  Widget _createNfcTravelDocumentReaderWidget(
      String authorityCertificatesFilePath) {
    return NfcTravelDocumentReaderWidget(
      configuration: _createNfcTravelDocumentReaderConfiguration(
          authorityCertificatesFilePath),
      onSucceeded: (travelDocument) => Navigator.of(context).pushReplacement(
          createRoute(NfcReadingResultScreen(travelDocument: travelDocument))),
      onCancelled: () {
        if (mounted) {
          var navigator = Navigator.of(context);
          if (navigator.canPop()) {
            navigator.pop();
          }
        }
      },
      onFailed: (exception) => Navigator.of(context).pushReplacement(
          createRoute(NfcReadingErrorScreen(message: exception.message))),
    );
  }

  NfcTravelDocumentReaderConfiguration
      _createNfcTravelDocumentReaderConfiguration(
          String? authorityCertificatesFilePath) {
    return NfcTravelDocumentReaderConfiguration(
      nfcKey: NfcKeyFactory.create(widget.machineReadableZone),
      authorityCertificatesFilePath: authorityCertificatesFilePath,
    );
  }
}
