import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(
      path,
    );

    await collection
        .add(data)
        .then((value) => log("Data Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }
}
