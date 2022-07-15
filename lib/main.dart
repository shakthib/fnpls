import 'package:firebase_core/firebase_core.dart';
import 'package:fixnoww/resources/auth_methods.dart';

import 'package:fixnoww/screens/home_screen.dart';
import 'package:fixnoww/screens/login_screen.dart';
import 'package:fixnoww/screens/new_complaint.dart';
import 'package:fixnoww/utils/colors.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/newc': (context) => const NewComplaintScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return HomeScreen();
          }

          return const LoginScreen();
        },
      ),
    );
  }
}
