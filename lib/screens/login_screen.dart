import 'package:fixnoww/resources/auth_methods.dart';
import 'package:fixnoww/utils/colors.dart';
import 'package:fixnoww/utils/utils.dart';
import 'package:fixnoww/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor, useMaterial3: true),
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Fix now',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          const Text(
            'Complain now to get it fixed immediately',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            text: 'Sign in',
            onPressed: () async {
              // _showToast(context);
              bool res = await _authMethods.signinWithGoogle(context);
              if (res) {
                // Navigator.pushNamed(context, '/home');
                showSnackBar(context, "Signed in");
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Admin"),
              ),
              onPressed: () => Navigator.pushNamed(context, '/admincheck'),
            ),
          )
        ],
      )),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Coming soon!'),
        action: SnackBarAction(
            label: 'UGH!', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
