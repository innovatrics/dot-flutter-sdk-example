import 'dart:io';

import 'package:dot_nfc/dot_nfc.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import '../progress_widget.dart';
import 'nfc_reading_error_screen.dart';
import 'nfc_reading_result_screen.dart';
import 'password_factory.dart';
import 'resolve_authority_certificates_file_use_case.dart';

class NfcReadingScreen extends StatefulWidget {
  final MachineReadableZone machineReadableZone;

  const NfcReadingScreen({
    super.key,
    required this.machineReadableZone,
  });

  @override
  State<NfcReadingScreen> createState() => _NfcReadingScreenState();
}

class _NfcReadingScreenState extends State<NfcReadingScreen> {
  late final Future<File> _authorityCertificatesFile;

  @override
  void initState() {
    super.initState();
    final assetBundle = DefaultAssetBundle.of(context);
    _authorityCertificatesFile =
        ResolveAuthorityCertificatesFileUseCase().resolve(assetBundle);
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
    String authorityCertificatesFilePath,
  ) {
    return NfcTravelDocumentReaderWidget(
      configuration: _createNfcTravelDocumentReaderConfiguration(
        authorityCertificatesFilePath,
      ),
      onSucceeded: (result) => Navigator.of(context).pushReplacement(
        createRoute(
          NfcReadingResultScreen(travelDocument: result.travelDocument),
        ),
      ),
      onCancelled: () {
        if (mounted) {
          var navigator = Navigator.of(context);
          if (navigator.canPop()) {
            navigator.pop();
          }
        }
      },
      onFailed: (exception) => Navigator.of(context).pushReplacement(
        createRoute(NfcReadingErrorScreen(message: exception.message)),
      ),
    );
  }

  NfcTravelDocumentReaderConfiguration
      _createNfcTravelDocumentReaderConfiguration(
    String? authorityCertificatesFilePath,
  ) {
    return NfcTravelDocumentReaderConfiguration(
      password: PasswordFactory.create(widget.machineReadableZone),
      authorityCertificatesFilePath: authorityCertificatesFilePath,
      iosPollingOption: IosPollingOption.standard,
      sessionToken: null,
    );
  }
}
