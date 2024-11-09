import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:codefather_app/api/models/user/user_model.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyUser = 'user_local';

  static Future<void> saveUser(UserModel user) async {
    final userJson = user.toJson();
    final userString = jsonEncode(userJson);
    await _storage.write(key: _keyUser, value: userString);
  }

  static Future<UserModel?> getUser() async {
    final userString = await _storage.read(key: _keyUser);
    if (userString == null) {
      return null;
    }
    final userJson = jsonDecode(userString);
    return UserModel.fromJson(userJson);
  }

  static Future<void> deleteUser() async {
    await _storage.delete(key: _keyUser);
  }

  static Future<bool> isUserLoggedIn() async {
    final user = await getUser();
    return user != null && user.id != null;
  }
}
