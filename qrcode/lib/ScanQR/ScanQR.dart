import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  QRViewController? scanController;
  String textQr = "";

  @override
  void reassemble() {
    super.reassemble();
    if (scanController != null) {
      scanController!.pauseCamera();
      scanController!.resumeCamera();
    }
  }

  @override
  void dispose() {
    scanController?.dispose();
     print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");

    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    scanController = controller;
    controller.scannedDataStream.listen((scanData) {
      final code = scanData.code;
      print("+++++++++++++++++code+++++++++++++++++++$code");
      if (code != null) {
        setState(() {
          textQr = code;
        });
      } else {
        setState(() {
          textQr = 'Invalid QR code';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: ListView(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Scanned Data: $textQr'),
            ),
          ),

        ],
      ),
    );
  }
}

