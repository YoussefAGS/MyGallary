

import 'package:flutter/material.dart';

import '../models/MyUser.dart';

class MyProvider extends ChangeNotifier{
   MyUser? myUser;

   MyProvider(){

   }
   void initUser(MyUser User){
    myUser= User;
    notifyListeners();
  }

}