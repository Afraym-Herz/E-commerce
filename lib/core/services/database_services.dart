abstract class DatabaseServices {

  Future<void> addData({required String path , required Map<String , dynamic> data, String? documentId});

  Future<dynamic> getData({required String path , String? docId , Map<String , dynamic>? query});

  Future<bool> checkDataExists({required String path , required String userId});

}