import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qrticket/firebase_options.dart';

class OrderService {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> createOrder({
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
      'id': idFromTimeAndName,
    });
    // Create order
  }
}
