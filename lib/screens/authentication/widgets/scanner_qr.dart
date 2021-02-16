import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:festi/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            _buildQrView(context),
            Align(
              alignment: Alignment.topCenter,
              child:  Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white,),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text("Escanear código QR", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                      IconButton(
                        icon: Icon(Icons.help, color: Colors.white,),
                        onPressed: () => Navigator.popAndPushNamed(context, '/categorias'),
                      ),
                    ],
                  )
              ),
            )
          ],
        )
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: ColorsFesti.AmarilloFesti,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    var code = await controller.scannedDataStream.first;
    if(code != null) {

      print("=========================== CODE ======================");
      print(code.format);
      print("=========================== CODE ======================");
      var stringToBase64 = utf8.fuse(base64);
      Navigator.pushNamed(context, "/restaurant", arguments: jsonDecode(stringToBase64.decode(code.code)));

    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}