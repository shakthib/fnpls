// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fixnoww/resources/auth_methods.dart';
import 'package:fixnoww/screens/my_closed_complaints_screen.dart';
import 'package:fixnoww/screens/my_complaints_screen.dart';
import 'package:fixnoww/screens/new_complaint.dart';
import 'package:fixnoww/screens/to_you_complaints_screen.dart';
import 'package:fixnoww/widgets/closed_complaints.dart';
import 'package:fixnoww/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthMethods _authMethods = AuthMethods();

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  signOut() {
    _authMethods.signOut();
    Navigator.of(context).pop();
  }

  closeDialog() {
    Navigator.of(context).pop();
  }

  List<Widget> pages = [MyComplaintsScreen(), MyClosedComplaintsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My complaints"),
            CustomDialog(
                btn1text: "No",
                btn2text: "Yes",
                content: "Are you sure you want to sign out?",
                onPressedbtn1: closeDialog,
                onPressedbtn2: signOut,
                title: "Sign out"),
          ],
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 255, 203, 34),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
          onDestinationSelected: onPageChanged,
          selectedIndex: _page,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 60,
          animationDuration: Duration(seconds: 1),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.library_books,
                size: 25,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.library_books,
                size: 25,
                color: Colors.white,
              ),
              label: 'Live complaints',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.close_outlined,
                size: 25,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.close,
                size: 25,
                color: Colors.white,
              ),
              label: 'Closed complaints',
            ),
          ],
        ),
      ),
    );
  }
}
