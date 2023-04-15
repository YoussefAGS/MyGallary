import 'package:flutter/material.dart';
import 'package:loginwithgalary/models/MyUser.dart';
import 'package:loginwithgalary/provider/my_provider.dart';
import 'package:loginwithgalary/screen/Layout/home_layout.dart';
import 'package:loginwithgalary/services/login_user.dart';
import 'package:provider/provider.dart';

import '../../base.dart';
import 'login-navigator.dart';
import 'login-view-model.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseView<LoginView, LoginViewModel>
    implements LoginNavigator {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }


  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.png'),
                  fit: BoxFit.cover)),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.only(left: 60 ,right: 60,top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text('My\nGellary',style: TextStyle(
                        color: Color(0xFF4A4A4A),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),textAlign: TextAlign.center),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Color(0xFF4A4A4A),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        controller: emailController,
                        validator: (value){
                          if(value!.trim()==""){
                            return "Please enter Your Email";
                          }
                          final bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if(!emailValid){
                            return "Please Enter a valid email";


                          }
                          return null;

                        },
                        textInputAction: TextInputAction.next,

                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'User Name',
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(121, 121, 121, 1.0),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: passwordController,
                        validator: (value){
                          if(value!.trim()==""){
                            return "Please enter password";
                          }
                          else if(value.length<8){
                            return "password must be greater than 8";

                          }
                          return null;

                        },
                        textInputAction: TextInputAction.next,

                        obscureText: true,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(121, 121, 121, 1.0),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ValidatForm();
                          },
                        child: Text(
                          'SUBMIT',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ButtonStyle(
                          visualDensity: VisualDensity.comfortable,
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.only(
                                right: MediaQuery.of(context).size.width*0.20,
                                left: MediaQuery.of(context).size.width*0.20,
                                top: 12,
                                bottom: 12
                            ),
                          ),
                          shadowColor: MaterialStatePropertyAll(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }

  @override
  void goToHome(MyUser myUser) {
    var provider = Provider.of<MyProvider>(context,listen: false);
    provider.initUser(myUser);
    Navigator.pushReplacementNamed(context, HomeLayout.routeName);
  }

  void ValidatForm() async{
    if (formkey.currentState!.validate()) {
      viewModel.loginWithFirbaseAuth(emailController.text, passwordController.text);
    }
  }
}


