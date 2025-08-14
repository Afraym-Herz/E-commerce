import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docId,
    Map<String, dynamic>? query,
  }) async {
    if (docId != null) {
      var data = await firestore.collection(path).doc(docId).get();

      if (!data.exists || data.data() == null) {
        throw Exception('Document not found for ID: $docId');
      }

      return data.data();
    } else {
        Query<Map<String, dynamic>> data = await firestore.collection(path);
      if (query != null) {

        if (query['orderBy'] != null) {
          var sellingCount = query['sellingCount'];
          var descending = query['descending'];
          data =  data.orderBy(sellingCount, descending: descending);
        }

        if (query['limit'] != null) {
          var limit = query['limit'];
          data =  data.limit(limit);
        }
        
        var result = await data.get();
        return result.docs.map((e) => e.data()).toList() ;
      } 
      
    }
  }

  @override
  Future<bool> checkDataExists({required String path, required String userId}) {
    var data = firestore.collection(path).doc(userId).get();
    return data.then((value) => value.exists);
  }
}
