import 'package:flutter/material.dart';
import 'package:qrticket/features/order_ticket/models/ticket.dart';

class TicketDataView extends StatefulWidget {
  final Ticket ticket;
  const TicketDataView({
    super.key,
    required this.ticket,
  });

  @override
  State<TicketDataView> createState() => _OrderViewState();
}

class _OrderViewState extends State<TicketDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          'Ticket information',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Family name",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    enabled: false,
                    controller:
                        TextEditingController(text: widget.ticket.familyName),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    "First name",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    enabled: false,
                    controller:
                        TextEditingController(text: widget.ticket.firstName),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "From",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextField(
                              enabled: false,
                              controller: TextEditingController(
                                  text: widget.ticket.startCity),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "To",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextField(
                              enabled: false,
                              controller: TextEditingController(
                                  text: widget.ticket.endCity),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Date",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextField(
                              enabled: false,
                              controller: TextEditingController(
                                text: widget.ticket.dateTime,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Time",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextField(
                              enabled: false,
                              controller: TextEditingController(
                                text: widget.ticket.dateTime,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
