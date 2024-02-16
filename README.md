# DOT Flutter SDK Example

A collection of quickstart samples demonstrating the DOT Flutter SDK. [Read more about DOT Flutter SDK](https://developers.innovatrics.com/digital-onboarding/).

## Setup

Choose your unique identifier (e.g. `com.company.dot.flutter.example`). This identifier is used as an Application ID (Android) and Bundle ID (iOS) in your host apps of the DOT Flutter SDK Example.

### Setup for Android platform

Replace `applicationId` in `android/app/build.gradle` with your unique identifier. Instead of:

```
applicationId 'com.innovatrics.dot.flutter.example'
```

there will be a new unique identifier. For example:

```
applicationId 'com.company.dot.flutter.example'
```

### Setup for iOS platform

1. Check if your CocoaPods is up to date with the command `pod --version`. If not, use the command `[sudo] gem install cocoapods`.
1. Run `pod install --repo-update` command in the `ios` directory in the project.
1. After the pod installation is finished, open Runner.xcworkspace in Xcode.
1. In the **General** tab of DotSdkSamples target, set your unique **Bundle Identifier**.
1. Complete app signing configuration using your certificates and profiles.

### Setup for both platforms

1. To obtain a license file, please contact `support@innovatrics.com` and send them your unique identifier.
1. Add the license file to `assets/dot_license.lic`.

## Samples

| Sample                    | Description             |
|:--------------------------|:------------------------|
| **Document Auto Capture** | Basic component sample. |
| **Face Auto Capture**     | Basic component sample. |
| **MagnifEye Liveness**    | Basic component sample. |

In case when the samples do not work because of the expired DOT license, please contact `support@innovatrics.com` in order to obtain a new license file.

## Changelog

All notable changes are documented in `CHANGELOG.md`.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Versioning

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
