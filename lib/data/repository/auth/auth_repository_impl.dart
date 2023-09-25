import 'package:equifax_app/domain/entity/login_error.dart';
import 'package:equifax_app/domain/entity/login_info.dart';
import 'package:equifax_app/domain/entity/request_response.dart';
import 'package:equifax_app/domain/entity/user_info.dart';
import 'package:equifax_app/domain/repository/auth/auth_repository.dart';

/// Fake implementation of Authenticaion and is used only as an example. This is where you would sub for
/// your own implementation.
class AuthRepositoyImpl extends AuthRepositoy {
  @override
  Future<RequestResponse<UserInfo, LoginError>> login(
    LoginInformation loginInformation,
  ) async {
    
    await Future.delayed(const Duration(seconds: 2));

    final email = loginInformation.email;
    final password = loginInformation.password;
    if (email.isEmpty) {
      return Future.value(RequestResponse.error(LoginError.emptyEmail));
    } else if (password.isEmpty) {
      return Future.value(RequestResponse.error(LoginError.emptyPassword));
    } else if (email == 'admin@testing.com' && password == 'admin') {
      return Future.value(RequestResponse.success(UserInfo(
        name: 'Admin',
        email: email,
      )));
    } else {
      return Future.value(
          RequestResponse.error(LoginError.incorrectEmailOrPassword));
    }
  }
}