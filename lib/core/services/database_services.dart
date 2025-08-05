abstract class DatabaseServices {

  Future<void> addUserData({required String path , required Map<String , dynamic> data, String? documentId});

  Future<Map<String , dynamic>> getUserData({required String path , required String userId});

  Future<bool> checkUserExists({required String path , required String userId});

}