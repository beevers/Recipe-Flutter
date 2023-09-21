import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scanProvider = ChangeNotifierProvider((ref) => ScanProvider());

class ScanProvider extends ChangeNotifier {
  String? scanBarCodeRes;
  Future<void> scanBarcode(bool mounted) async {
    String barcodeScanRes;
    try {
      print("seeee thissss${scanBarCodeRes.runtimeType}");
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#1FCC79", // Color for the scan button
        "Cancel", // Text for the cancel button
        true, // Show flash icon
        ScanMode.QR, // Specify the type of barcode you want to scan
      );
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    scanBarCodeRes = barcodeScanRes;

    notifyListeners();
  }
}
