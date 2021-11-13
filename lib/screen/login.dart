import 'package:flutter/material.dart';
import 'package:gray_quest/controller/login_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/provider/user_id_provider.dart';
import '../theme.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {


  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var _userNameController = TextEditingController();
  var _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Center(child: Text('LOG IN' , style: Theme.of(context).textTheme.bodyText1,),),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery
                        .of(context)
                        .size
                        .height / 30,
                  ),
                  child: Text(
                    "Email ID",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery
                          .of(context)
                          .size
                          .height / 30,
                      vertical: 5),
                  child: TextField(
                    controller: _passwordController,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).cardColor,
                      filled: true,
                      hintText: "example@gmail.com",
                      hintStyle: Theme
                          .of(context)
                          .textTheme
                          .bodyText1,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery
                        .of(context)
                        .size
                        .height / 30,
                  ),
                  child: Text(
                    "Password",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery
                          .of(context)
                          .size
                          .height / 30,
                      vertical: 5),
                  child: TextField(
                    controller: _userNameController,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,

                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).cardColor,
                      filled: true,
                      hintText:
                      "******",
                      hintStyle: Theme
                          .of(context)
                          .textTheme
                          .bodyText1,
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Center(
                  child: MaterialButton(
                    elevation: 6.0,
                    shape: AppTheme.shape,
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery
                        .of(context)
                        .size
                        .height / 6,
                        vertical: MediaQuery
                            .of(context)
                            .size
                            .height / 50),
                    color: Theme
                        .of(context)
                        .primaryColor,
                    child: Text(
                      "Continue",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      int loginData = -1;
                      String snackBarText = "Invalid input ! Unable to login";
                      if(_userNameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                        loginData = await login(
                            _userNameController.text, _passwordController.text);
                      }
                      if(loginData != -1) {
                        context
                            .read(userIdProvider)
                            .state = loginData;
                        snackBarText = "Login successful";
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(snackBarText),
                        ),
                      );
                      if(loginData!=-1) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }
                    },),
                )
              ],
            ),)
      )
      ,
    );
  }
}

