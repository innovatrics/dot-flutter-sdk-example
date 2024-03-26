import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class ResolveAuthorityCertificatesFileUseCase {
  static const String _authorityCertificatesFilename =
      'authenticity_certificates.pem';

  Future<File> resolve(BuildContext context) async {
    final file = await _createAuthorityCertificatesFile();
    await _writeAuthorityCertificatesToFile(context, file);
    return file;
  }

  Future<File> _createAuthorityCertificatesFile() async {
    final temporaryDirectory = await getTemporaryDirectory();
    return new File(
        '${temporaryDirectory.path}/$_authorityCertificatesFilename');
  }

  Future<void> _writeAuthorityCertificatesToFile(
      BuildContext context, File file) async {
    final ByteData byteData = await DefaultAssetBundle.of(context)
        .load('assets/$_authorityCertificatesFilename');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
}
