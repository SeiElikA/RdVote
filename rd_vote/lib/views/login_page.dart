// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rd_vote/view_model/login_view_model.dart';
import 'package:rd_vote/views/test_page.dart';

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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(children: [
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Rd",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Vote",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 32),
              TextField(
                controller: viewModel.emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              TextField(
                controller: viewModel.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: () {
                  viewModel.loginClick(context);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 24),
              TextButton(
                onPressed: () async {
                  await viewModel.googleSignIn(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestPage()));
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: Colors.black,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 12),
                        Icon(Icons.import_contacts),
                        Spacer()
                      ],
                    ),

                    Text(
                      "Google Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
