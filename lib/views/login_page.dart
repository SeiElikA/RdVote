// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rd_vote/component/style.dart';
import 'package:rd_vote/utils/colors.dart';
import 'package:rd_vote/view_model/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel viewModel;

  @override
  void didChangeDependencies() {
    viewModel = Provider.of<LoginViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(children: [
                SizedBox(height: 12),
                Image.asset("assert/img_login_background.png",
                    height: screenSize.height * 0.2),
                SizedBox(height: 20),
                Text(
                  "Welcome",
                  style: TextStyle(
                      color: myColor.mainColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Please enter the details below to continue.",
                    style: TextStyle(color: myColor.hintColor, fontSize: 16)),
                SizedBox(height: 32),
                // email field
                Container(
                  decoration: roundDecoration(),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: viewModel.emailController,
                      decoration:
                          textFieldDecoration().copyWith(hintText: "Email")),
                ),
                SizedBox(height: 20),
                // password field
                Container(
                  decoration: roundDecoration(),
                  child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: viewModel.passwordController,
                      decoration:
                          textFieldDecoration().copyWith(hintText: "Password")),
                ),
                SizedBox(
                  height: 32,
                ),

                // login button
                TextButton(
                  onPressed: () {
                    viewModel.loginClick(context);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 48),
                      backgroundColor: myColor.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 12,
                      shadowColor: myColor.mainColor.withOpacity(0.44)),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),

                SizedBox(height: 32),

                // divider
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: myColor.hintColor,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "OR",
                      style: TextStyle(color: myColor.hintColor),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Divider(
                        color: myColor.hintColor,
                      ),
                    )
                  ],
                ),

                SizedBox(height: 24),

                //google login button
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: Offset(0, 8),
                            blurRadius: 12)
                      ]),
                  padding: EdgeInsets.all(12),
                  child: Image.asset(
                    "assert/img_google.png",
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don’t have an account ? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text("Register",
                            style: TextStyle(
                                fontSize: 16, color: myColor.mainColor)))
                  ],
                ),
                SizedBox(height: 12)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
