import 'dart:typed_data';

import 'package:dot_document/dot_document.dart';
import 'package:dot_flutter_sdk_example/page_routes.dart';
import 'package:flutter/material.dart';

import 'document_auto_capture_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    _initDotSdk = initDotSdkAsync();
  }

  Future<void> initDotSdkAsync() async {
    if (await DotSdk.instance.isInitialized()) {
      return;
    }

    final ByteData licenseByteData =
        await DefaultAssetBundle.of(context).load('assets/dot_license.lic');
    await DotSdk.instance.initialize(DotSdkConfiguration(
        licenseBytes: licenseByteData.buffer.asUint8List(),
        libraries: [DotDocumentLibrary()]));
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
                return createProgress();
              }
            },
          ),
        ));
  }

  Widget createLicenseError() {
    return Text('License file is not valid.');
  }

  Widget createProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Widget createComponentList(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _createComponent(
            title: 'Document Auto Capture',
            subtitle: 'Basic component sample.',
            onPressed: () {
              Navigator.of(context).push(
                  createRouteWithoutAnimation(DocumentAutoCaptureScreen()));
            }),
      ],
    );
  }

  Widget _createComponent(
      {required String title,
      required String subtitle,
      VoidCallback? onPressed}) {
    return Container(
        width: double.infinity,
        child: Card(
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            trailing:
                ElevatedButton(onPressed: onPressed, child: Text('Start')),
          ),
        ));
  }
}
