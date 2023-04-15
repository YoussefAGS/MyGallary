import 'package:loginwithgalary/provider/my_provider.dart';
import 'package:provider/provider.dart';

import '../helper/api.dart';
import '../models/MyUser.dart';


class LoginUser {
  static Future<MyUser> Login({required String email, required String password,}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://technichal.prominaagency.com/api/auth/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    MyUser user=MyUser.fromJson(data);
    return user;
  }
}
