import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_vote/utils/colors.dart';
import 'package:rd_vote/view_model/login_view_model.dart';
import 'package:rd_vote/views/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
    ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RdVote',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF7296C8, myColor.colors),
      ),
      home: const LoginPage(),
    );
  }
}