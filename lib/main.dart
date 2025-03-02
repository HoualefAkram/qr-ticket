import 'package:flutter/material.dart';
import 'package:qrticket/features/order_ticket/screens/home_view.dart';
import 'package:qrticket/features/order_ticket/utils/ticket_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Main(),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    TicketService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
