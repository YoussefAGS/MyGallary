

import 'package:loginwithgalary/base.dart';

import '../../models/MyUser.dart';

abstract class LoginNavigator extends BaseNavigator{
  void goToHome(MyUser myUser);

}