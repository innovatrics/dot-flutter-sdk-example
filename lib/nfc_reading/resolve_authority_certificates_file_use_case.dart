import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class ResolveAuthorityCertificatesFileUseCase {
  static const String _authorityCertificatesFilename =
      'authenticity_certificates.pem';

  Future<File> resolve(AssetBundle assetBundle) async {
    final file = await _createAuthorityCertificatesFile();
    await _writeAuthorityCertificatesToFile(assetBundle, file);
    return file;
  }

  Future<File> _createAuthorityCertificatesFile() async {
    final temporaryDirectory = await getTemporaryDirectory();
    return File('${temporaryDirectory.path}/$_authorityCertificatesFilename');
  }

  Future<void> _writeAuthorityCertificatesToFile(
    AssetBundle assetBundle,
    File file,
  ) async {
    final ByteData byteData =
        await assetBundle.load('assets/$_authorityCertificatesFilename');
    await file.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );
  }
}
