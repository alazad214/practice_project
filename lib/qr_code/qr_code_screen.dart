import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QRCodeWithLogo extends StatelessWidget {
  const QRCodeWithLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code with Logo")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            QrImageView(
              data: "https://www.loom.com/share/d9811568652d4c55b77f88d240bac873",
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Colors.white,
            ),
            Positioned(
              child: Container(
                width: 30,
                height: 30,
                 padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.home),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
