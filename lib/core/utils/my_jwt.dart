import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:todo/core/auth_token_storage/auth_token_storage.dart';
import 'package:todo/core/model/authentication_entity.dart';

class MyJwt {
  final AuthTokenStorage _authStorage = AuthTokenStorage.instance;

    Future<int?> getUserId() async {
      AuthInfo? auth = await _authStorage.load();
    if(auth != null){
      Map<String, dynamic> decodedToken = JwtDecoder.decode(auth.access);
      print(decodedToken['user_id']);
      return decodedToken['user_id'];
    }else{
      return null;
    }

  }

    Future<String?> getAccessToken() async {
      AuthInfo? auth = await _authStorage.load();
    if(auth != null){
      return auth.access;
    }else{
      return null;
    }
  }
}