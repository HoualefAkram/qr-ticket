import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qrticket/features/order_ticket/screens/ticket_qr_view.dart';
import 'package:qrticket/features/order_ticket/utils/ticket_service.dart';
import 'package:qrticket/features/shared/helpers/loading/loading_screen.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late final TextEditingController _familyNameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _startCityController;
  late final TextEditingController _endCityController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;

  @override
  void initState() {
    _familyNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _startCityController = TextEditingController();
    _endCityController = TextEditingController();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    super.initState();
  }

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
          'Order Ticket',
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
                    controller: _familyNameController,
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
                    controller: _firstNameController,
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
                              controller: _startCityController,
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
                              controller: _endCityController,
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
                              controller: _dateController,
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
                              controller: _timeController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
                LoadingScreen().show(context: context, text: "Ordering...");
                final String id = await TicketService.createOrder(
                  familyName: _familyNameController.text,
                  firstName: _firstNameController.text,
                  startCity: _startCityController.text,
                  endCity: _endCityController.text,
                  date: _dateController.text,
                );
                log("Order created");
                LoadingScreen().hide();
                if (!context.mounted) return;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TicketQrView(
                      text: id,
                    ),
                  ),
                );
              },
              child: Ink(
                width: MediaQuery.sizeOf(context).width,
                height: 70,
                color: Colors.black87,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Buy now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
