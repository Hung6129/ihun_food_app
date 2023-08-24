import 'package:dio/dio.dart';

import '../../../../config/flutter_toast.dart';
import '../../../../core/app_urls.dart';

abstract class AuthticateSources {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
  Future<bool> logout();
}

class AuthticateSourcesImplementation implements AuthticateSources {
  final Dio _dio;

  AuthticateSourcesImplementation(this._dio);
  @override
  Future<bool> login(String email, String password) async {
    print('18 email $email');
    print('19 password $password');
    try {
      if (email.isEmpty || password.isEmpty) {
        toastInfor(text: "Email or password is empty");
        return false;
      } else if (!email.contains('@') ||
          !email.contains('.') ||
          email.length < 6) {
        toastInfor(text: "Email is invalid");
        return false;
      } else if (password.length < 6) {
        toastInfor(text: "Password must be at least 6 characters");
        return false;
      }
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await _dio.post(
        AppUrls.baseUrl + AppUrls.logIn,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        toastInfor(text: "Login success");
        return true;
      } else {
        toastInfor(text: "Login failed");
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() {
    throw UnimplementedError();
  }

  @override
  Future<bool> register(String email, String password) {
    throw UnimplementedError();
  }
}
