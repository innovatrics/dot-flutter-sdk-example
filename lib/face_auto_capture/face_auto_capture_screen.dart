import 'package:dot_face_core/dot_face_core.dart';
import 'package:flutter/material.dart';

import '../page_routes.dart';
import 'face_auto_capture_result_screen.dart';

class FaceAutoCaptureScreen extends StatelessWidget {
  const FaceAutoCaptureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Auto Capture'),
      ),
      body: FaceAutoCaptureWidget(
        configuration: FaceAutoCaptureConfiguration(
          base: BaseFaceAutoCaptureConfiguration(
            faceLibraryComponent: FaceLibraryComponentConfiguration(
              faceSizeRatioInterval: IntervalDouble(min: 0.1, max: 0.3),
              query: FaceDetectionQuery(
                faceQuality: FaceQualityQuery(
                  imageQuality: FaceImageQualityQuery(
                    evaluateSharpness: true,
                    evaluateBrightness: true,
                    evaluateContrast: true,
                    evaluateUniqueIntensityLevels: true,
                    evaluateShadow: true,
                    evaluateSpecularity: true,
                  ),
                  headPose: HeadPoseQuery(
                    evaluateRoll: true,
                    evaluateYaw: true,
                    evaluatePitch: true,
                  ),
                  wearables: WearablesQuery(
                    evaluateGlasses: true,
                  ),
                  expression: ExpressionQuery(
                    eyes: EyesExpressionQuery(
                      evaluateRightEye: true,
                      evaluateLeftEye: true,
                    ),
                    evaluateMouth: true,
                  ),
                ),
              ),
            ),
          ),
        ),
        onCreated: (controller) => controller.start(),
        onFinished: (result) => Navigator.of(context).pushReplacement(
          createRoute(FaceAutoCaptureResultScreen(result: result)),
        ),
      ),
    );
  }
}
