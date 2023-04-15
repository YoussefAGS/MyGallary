


import 'package:loginwithgalary/base.dart';

import '../../models/MyUser.dart';
import '../../services/login_user.dart';
import 'login-navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator>{

  String message="";
  void loginWithFirbaseAuth(String emailAddress,String password)async{
      navigator!.showLoading();
      MyUser? myUser=await LoginUser.Login(email:  emailAddress, password: password);
      message = "Login successful";
      if(myUser!=null){
        navigator!.hideLoading();
        navigator!.goToHome(myUser);
        return;
      }


    if(message!=""){
      navigator!.hideLoading();
      navigator!.showMessage(message);
    }
  }
}