import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/view/widget/button/app_button.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  dynamic scanBarCodeRes;
  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Color for the scan button
        "Cancel", // Text for the cancel button
        true, // Show flash icon
        ScanMode.QR, // Specify the type of barcode you want to scan
      );
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      scanBarCodeRes = barcodeScanRes;
    });

    // Handle the scanned result (barcodeScanRes) as needed
    print('Scanned barcode: $barcodeScanRes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Result: $scanBarCodeRes"),
            AppButton(isLoading: false, function: scanBarcode, isLarge: false),
          ],
        ),
      ),
    );
  }
}
