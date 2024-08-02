import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../ScanQR/ScanQR.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(

          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Enter data to generate barcode',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                print("Data: ${_inputController.text}");
              },
              child: Text('Generate Barcode'),
            ),
            SizedBox(height: 16),
            // Builder(
            //   builder: (BuildContext context) {
            //     return IconButton(
            //       onPressed: () {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const ScanQR(),
            //           ),
            //         );
            //       },
            //       highlightColor: Colors.redAccent,
            //       splashColor: Colors.redAccent,
            //       icon: const Icon(
            //         Icons.add_circle,
            //         color: Colors.black12,
            //         size: 30,
            //       ),
            //     );
            //   },
            // ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScanQR()));
                });
                print("Data: ${_inputController.text}");
              },
              child: Text('Scanner Barcode'),
            ),

            SizedBox(height: 16),
            if (_inputController.text.isNotEmpty)
              Center(child: QrImageView(
                data: _inputController.text, // The data to encode
                version: QrVersions.auto,
                size: 200.0,
                gapless: false,
              ),),
            if (_inputController.text.isNotEmpty)
              SizedBox(height: 16),
            Center(child:Text(_inputController.text),)
          ],
        ),
      ),
    );
  }
}
