import 'package:flutter/material.dart';

import '../component/style.dart';
import '../utils/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(children: [
            Text(
              "Create a New Account",
              style: TextStyle(
                  color: myColor.mainColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text("Create an account so you can random your\nitem and vote item from other account",
                style: TextStyle(color: myColor.hintColor, fontSize: 16)),

            SizedBox(height: 32),

            Row(children: [
              Expanded(child: Container(
                decoration: roundDecoration(),
                child: TextField(
                    keyboardType: TextInputType.name,
                    decoration:
                    textFieldDecoration().copyWith(hintText: "First Name")),
              ),),
              SizedBox(width: 20),
              Expanded(child: Container(
                decoration: roundDecoration(),
                child: TextField(
                    keyboardType: TextInputType.name,
                    decoration:
                    textFieldDecoration().copyWith(hintText: "Last Name")),
              ),)
            ],),

            SizedBox(height: 20),

            Container(
              decoration: roundDecoration(),
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                  textFieldDecoration().copyWith(hintText: "Email")),
            ),

            SizedBox(height: 20),

            Container(
              decoration: roundDecoration(),
              child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:
                  textFieldDecoration().copyWith(hintText: "Password")),
            ),
            SizedBox(height: 20),

            Container(
              decoration: roundDecoration(),
              child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:
                  textFieldDecoration().copyWith(hintText: "Confirm Password")),
            ),

            SizedBox(height: 32),

            TextButton(
              onPressed: () {

              },
              style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 12,
                  shadowColor: myColor.mainColor.withOpacity(0.44)),
              child: Text(
                "Create Account",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            SizedBox(height: 8),

            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text("Cancel", style: TextStyle(color: myColor.errorColor, fontSize: 16),)),

            SizedBox(height: 32),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Have an account ? ",
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 16, color: myColor.mainColor)))
              ],
            ),
          ],),
        ),
      ),
    );
  }
}
