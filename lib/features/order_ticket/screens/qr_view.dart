import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:qrticket/features/order_ticket/models/ticket.dart';
import 'package:qrticket/features/order_ticket/screens/ticket_data_view.dart';
import 'package:qrticket/features/order_ticket/utils/ticket_service.dart';

class QrTicketView extends StatefulWidget {
  const QrTicketView({super.key});

  @override
  State<QrTicketView> createState() => _QrTicketViewState();
}

class _QrTicketViewState extends State<QrTicketView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _isNavigating = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.cyan,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: MediaQuery.sizeOf(context).width * 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code == null || _isNavigating) return;
      _isNavigating = true;
      Ticket? ticket = await TicketService.getTicketFromId(scanData.code!);
      log("ticket: $ticket");
      if (ticket != null) {
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => TicketDataView(
              ticket: ticket,
            ),
          ),
        )
            .then((_) {
          _isNavigating = false;
        });
        TicketService.markTicketAsUsed(scanData.code!);
      } else {
        _isNavigating = false;
      }
    });
  }
}
