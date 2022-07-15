// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fixnoww/resources/firestore_resource.dart';
import 'package:fixnoww/utils/colors.dart';
import 'package:fixnoww/utils/utils.dart';
import 'package:fixnoww/widgets/closed_complaints.dart';
import 'package:fixnoww/widgets/complaints_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class MyClosedComplaintsScreen extends StatefulWidget {
  const MyClosedComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<MyClosedComplaintsScreen> createState() =>
      _MyClosedComplaintsScreenState();
}

class _MyClosedComplaintsScreenState extends State<MyClosedComplaintsScreen> {
  fabPress() {
    showSnackBar(context, "HIHI");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: secondaryBackgroundColor,
        body: ClosedComplaintsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // FirestoreMethods().addToMeetingHistory(
            //     context, "New comp", "I am giving this new complain");
            Navigator.pushNamed(context, '/newc');
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
