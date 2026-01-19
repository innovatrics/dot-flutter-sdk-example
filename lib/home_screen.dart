import 'dart:typed_data';

import 'package:dot_document/dot_document.dart';
import 'package:dot_face_core/dot_face_core.dart';
import 'package:dot_nfc/dot_nfc.dart';
import 'package:flutter/material.dart';

import 'document_auto_capture/document_auto_capture_screen.dart';
import 'face_auto_capture/face_auto_capture_screen.dart';
import 'magnifeye_liveness/magnifeye_liveness_screen.dart';
import 'nfc_reading/password_capture_screen.dart';
import 'page_routes.dart';
import 'progress_widget.dart';
import 'smile_liveness/smile_liveness_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<void> _initDotSdk;

  @override
  void initState() {
    super.initState();
    final assetBundle = DefaultAssetBundle.of(context);
    _initDotSdk = initDotSdkAsync(assetBundle);
  }

  Future<void> initDotSdkAsync(AssetBundle assetBundle) async {
    if (await DotSdk.instance.isInitialized()) {
      return;
    }

    final ByteData licenseByteData =
        await assetBundle.load('assets/dot_license.lic');
    await DotSdk.instance.initialize(
      DotSdkConfiguration(
        licenseBytes: licenseByteData.buffer.asUint8List(),
        libraries: Libraries(
          document: DotDocumentLibraryConfiguration(),
          face: DotFaceLibraryConfiguration(
            modules: FaceModules(
              detection: DotFaceDetectionFastModuleConfiguration(),
              expressionNeutral: DotFaceExpressionNeutralModuleConfiguration(),
            ),
          ),
          nfc: DotNfcLibraryConfiguration(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOT SDK Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: _initDotSdk,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return createLicenseError();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return createComponentList(context);
            } else {
              return const ProgressWidget();
            }
          },
        ),
      ),
    );
  }

  Widget createLicenseError() {
    return Text('License file is not valid.');
  }

  Widget createComponentList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _createComponent(
            title: 'Document Auto Capture',
            subtitle: 'Basic component sample.',
            onPressed: () {
              Navigator.of(context).push(
                createRouteWithoutAnimation(DocumentAutoCaptureScreen()),
              );
            },
          ),
          _createComponent(
            title: 'NFC Reading',
            subtitle:
                'Combination of Document Auto Capture component with enabled MRZ recognition and NFC Travel Document Reader component.',
            onPressed: () {
              Navigator.of(context)
                  .push(createRouteWithoutAnimation(PasswordCaptureScreen()));
            },
          ),
          _createComponent(
            title: 'Face Auto Capture',
            subtitle: 'Basic component sample.',
            onPressed: () {
              Navigator.of(context)
                  .push(createRouteWithoutAnimation(FaceAutoCaptureScreen()));
            },
          ),
          _createComponent(
            title: 'Smile Liveness',
            subtitle: 'Basic component sample.',
            onPressed: () {
              Navigator.of(context)
                  .push(createRouteWithoutAnimation(SmileLivenessScreen()));
            },
          ),
          _createComponent(
            title: 'MagnifEye Liveness',
            subtitle: 'Basic component sample.',
            onPressed: () {
              Navigator.of(context)
                  .push(createRouteWithoutAnimation(MagnifEyeLivenessScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _createComponent({
    required String title,
    required String subtitle,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: ElevatedButton(onPressed: onPressed, child: Text('Start')),
        ),
      ),
    );
  }
}
