import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qrticket/features/order_ticket/models/ticket.dart';
import 'package:qrticket/firebase_options.dart';

class TicketService {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<String> createOrder({
    required String familyName,
    required String firstName,
    required String startCity,
    required String endCity,
    required String date,
  }) async {
    final String idFromTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String idFromTimeAndName = '$idFromTime-$familyName-$firstName';
    await FirebaseFirestore.instance.collection('orders').add({
      'familyName': familyName,
      'firstName': firstName,
      'startCity': startCity,
      'endCity': endCity,
      'date': date,
      'isUsed': false,
      'id': idFromTimeAndName,
    });
    return idFromTimeAndName;
  }

  static Future<Ticket?> getTicketFromId(String id) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('orders').get();
    final queryDocumentSnapshot = querySnapshot.docs.where(
      (element) => element.data()["id"] == id,
    );
    if (queryDocumentSnapshot.isEmpty) return null;
    final data = queryDocumentSnapshot.first.data();
    return Ticket(
      familyName: data['familyName'],
      firstName: data['firstName'],
      startCity: data['startCity'],
      endCity: data['endCity'],
      dateTime: data['date'],
      id: data['id'],
      isUsed: data['isUsed'],
    );
  }

  static Future<void> markTicketAsUsed(String id) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('orders').get();
    final queryDocumentSnapshot = querySnapshot.docs.where(
      (element) => element.data()["id"] == id,
    );
    if (queryDocumentSnapshot.isEmpty) return;
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(queryDocumentSnapshot.first.id)
        .update({
      'isUsed': true,
    });
  }
}
