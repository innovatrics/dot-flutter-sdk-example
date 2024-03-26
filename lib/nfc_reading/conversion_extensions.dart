import 'package:dot_flutter_sdk_example/conversion_extensions.dart';
import 'package:dot_nfc/dot_nfc.dart';

extension TravelDocumentExt on TravelDocument {
  Map<String, dynamic> toJson() {
    return {
      'ldsMasterFile': ldsMasterFile.toJson(),
      'ldsVersion': ldsVersion,
      'accessControlProtocolUsed': accessControlProtocolUsed.name,
      'authenticationStatus': authenticationStatus.toJson(),
      'machineReadableZoneInformation': machineReadableZoneInformation.toJson(),
      'encodedIdentificationFeaturesFace':
          encodedIdentificationFeaturesFace.toJson(),
      'displayedSignatureOrUsualMark': displayedSignatureOrUsualMark?.toJson(),
      'additionalPersonalDetails': additionalPersonalDetails?.toJson(),
      'additionalDocumentDetails': additionalDocumentDetails?.toJson(),
      'optionalDetails': optionalDetails?.toJson(),
    };
  }
}

extension LdsMasterFileExt on LdsMasterFile {
  Map<String, dynamic> toJson() {
    return {
      'lds1eMrtdApplication': lds1eMrtdApplication.toJson(),
    };
  }
}

extension Lds1eMrtdApplicationExt on Lds1eMrtdApplication {
  Map<String, dynamic> toJson() {
    return {
      'comHeaderAndDataGroupPresenceInformation':
          comHeaderAndDataGroupPresenceInformation.toJson(),
      'sodDocumentSecurityObject': sodDocumentSecurityObject.toJson(),
      'dg1MachineReadableZoneInformation':
          dg1MachineReadableZoneInformation.toJson(),
      'dg2EncodedIdentificationFeaturesFace':
          dg2EncodedIdentificationFeaturesFace.toJson(),
      'dg3AdditionalIdentificationFeatureFingers':
          dg3AdditionalIdentificationFeatureFingers?.toJson(),
      'dg4AdditionalIdentificationFeatureIrises':
          dg4AdditionalIdentificationFeatureIrises?.toJson(),
      'dg5DisplayedPortrait': dg5DisplayedPortrait?.toJson(),
      'dg7DisplayedSignatureOrUsualMark':
          dg7DisplayedSignatureOrUsualMark?.toJson(),
      'dg8DataFeatures': dg8DataFeatures?.toJson(),
      'dg9StructureFeatures': dg9StructureFeatures?.toJson(),
      'dg10SubstanceFeatures': dg10SubstanceFeatures?.toJson(),
      'dg11AdditionalPersonalDetails': dg11AdditionalPersonalDetails?.toJson(),
      'dg12AdditionalDocumentDetails': dg12AdditionalDocumentDetails?.toJson(),
      'dg13OptionalDetails': dg13OptionalDetails?.toJson(),
      'dg14SecurityOptions': dg14SecurityOptions?.toJson(),
      'dg15ActiveAuthenticationPublicKeyInfo':
          dg15ActiveAuthenticationPublicKeyInfo?.toJson(),
      'dg16PersonsToNotify': dg16PersonsToNotify?.toJson(),
    };
  }
}

extension Lds1ElementaryFileExt on Lds1ElementaryFile {
  Map<String, dynamic> toJson() {
    return {
      'id': id.name,
      'bytes': bytes?.toJson(),
    };
  }
}

extension AuthenticationStatusExt on AuthenticationStatus {
  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'chip': chip.toJson(),
    };
  }
}

extension DataAuthenticationStatusExt on DataAuthenticationStatus {
  Map<String, dynamic> toJson() {
    return {
      'status': status.name,
      'protocol': protocol.name,
    };
  }
}

extension ChipAuthenticationStatusExt on ChipAuthenticationStatus {
  Map<String, dynamic> toJson() {
    return {
      'status': status.name,
      'protocol': protocol?.name,
      'activeAuthenticationResponse': activeAuthenticationResponse?.toJson(),
    };
  }
}

extension MachineReadableZoneInformationExt on MachineReadableZoneInformation {
  Map<String, dynamic> toJson() {
    return {
      'documentCode': documentCode,
      'issuingStateOrOrganization': issuingStateOrOrganization,
      'nameOfHolder': nameOfHolder.toJson(),
      'nationality': nationality,
      'documentNumber': documentNumber,
      'dateOfBirth': dateOfBirth,
      'sex': sex,
      'dateOfExpiry': dateOfExpiry,
      'optionalData': optionalData,
    };
  }
}

extension NameOfHolderExt on NameOfHolder {
  Map<String, dynamic> toJson() {
    return {
      'primaryIdentifier': primaryIdentifier,
      'secondaryIdentifier': secondaryIdentifier,
    };
  }
}

extension EncodedIdentificationFeaturesFaceExt
    on EncodedIdentificationFeaturesFace {
  Map<String, dynamic> toJson() {
    return {
      'faceImage': faceImage?.toJson(),
    };
  }
}

extension DisplayedSignatureOrUsualMarkExt on DisplayedSignatureOrUsualMark {
  Map<String, dynamic> toJson() {
    return {
      'displayedSignatureOrUsualMarkImage':
          displayedSignatureOrUsualMarkImage?.toJson(),
    };
  }
}

extension AdditionalPersonalDetailsExt on AdditionalPersonalDetails {
  Map<String, dynamic> toJson() {
    return {
      'nameOfHolder': nameOfHolder?.toJson(),
      'otherNames': otherNames,
      'personalNumber': personalNumber,
      'fullDateOfBirth': fullDateOfBirth,
      'placeOfBirth': placeOfBirth,
      'address': address,
      'telephone': telephone,
      'profession': profession,
      'title': title,
      'personalSummary': personalSummary,
      'otherValidTravelDocumentNumbers': otherValidTravelDocumentNumbers,
      'custodyInformation': custodyInformation,
    };
  }
}

extension AdditionalDocumentDetailsExt on AdditionalDocumentDetails {
  Map<String, dynamic> toJson() {
    return {
      'issuingAuthority': issuingAuthority,
      'dateOfIssue': dateOfIssue,
      'otherPersonDetails': otherPersonDetails,
      'endorsementsOrObservations': endorsementsOrObservations,
      'taxOrExitRequirements': taxOrExitRequirements,
      'personalizationTime': personalizationTime,
      'personalizationDeviceSerialNumber': personalizationDeviceSerialNumber,
    };
  }
}

extension OptionalDetailsExt on OptionalDetails {
  Map<String, dynamic> toJson() {
    return {
      'content': content?.toJson(),
    };
  }
}
