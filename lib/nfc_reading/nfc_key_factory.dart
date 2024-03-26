import 'package:dot_document/dot_document.dart';
import 'package:dot_nfc/dot_nfc.dart';

class NfcKeyFactory {
  static NfcKey create(MachineReadableZone machineReadableZone) {
    if (machineReadableZone.td1 != null) {
      return NfcKey(
        documentNumber: machineReadableZone.td1!.documentNumber.value,
        dateOfExpiry: machineReadableZone.td1!.dateOfExpiry.value,
        dateOfBirth: machineReadableZone.td1!.dateOfBirth.value,
      );
    } else if (machineReadableZone.td2 != null) {
      return NfcKey(
        documentNumber: machineReadableZone.td2!.documentNumber.value,
        dateOfExpiry: machineReadableZone.td2!.dateOfExpiry.value,
        dateOfBirth: machineReadableZone.td2!.dateOfBirth.value,
      );
    } else if (machineReadableZone.td3 != null) {
      return NfcKey(
        documentNumber: machineReadableZone.td3!.passportNumber.value,
        dateOfExpiry: machineReadableZone.td3!.dateOfExpiry.value,
        dateOfBirth: machineReadableZone.td3!.dateOfBirth.value,
      );
    } else {
      throw Exception('Machine Readable Zone must be present.');
    }
  }
}
