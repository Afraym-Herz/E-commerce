import 'dart:convert';

import 'package:e_commerce/core/services/shared_preferences_singelton.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';

UserEntity getSavedUserData({required String key}) {
  var json = jsonDecode(Prefs.getString(key));
  return UserModel.fromJson(json);
}
