import 'dart:async';
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:todo/core/constants/constants.dart';
import 'package:todo/core/model/authentication_entity.dart';


class AuthTokenStorage {
  static AuthTokenStorage? _instance;

  final StreamController<AuthInfo?> _streamController;

  static AuthTokenStorage get instance => _instance ??= AuthTokenStorage._();

  AuthTokenStorage._()
      : _streamController = StreamController.broadcast();

  Future<void> save(AuthInfo authInfo) async {
    await GetStorage()
        .write(Constants.userAuthenticationKey, jsonEncode(authInfo.toJson()));
    _streamController.add(authInfo);
    return;
  }

  Future<AuthInfo?> load() async {
    var authInfo = GetStorage();
    if (authInfo.read(Constants.userAuthenticationKey) != null) {
      return AuthInfo.fromJson(jsonDecode(authInfo.read(Constants.userAuthenticationKey)));
    }
    return null;
  }

  Future<void> delete() async {
    //await _secureStorage.delete(key: "auth");
    (await GetStorage().remove(Constants.userAuthenticationKey));
    _streamController.add(null);
  }

  Stream<AuthInfo?> watch() => _streamController.stream;
}
