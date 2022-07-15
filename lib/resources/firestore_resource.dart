import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixnoww/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get myComplaints => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('complaints')
      .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> get PendingComplaints =>
      _firestore.collection('complaints').snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> get myClosedComplaints =>
      _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('closed_complaints')
          .snapshots();

  void addComplaintToUserDB(
      BuildContext context, String title, String complain) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('complaints')
          .add({
        'title': title,
        'complain': complain,
        'createdAt': DateTime.now(),
        'givenBy': _auth.currentUser!.displayName.toString(),
      });
    } catch (e) {
      print(e);
    }

    _showToast(context);
  }

  void addComplaintToAdminDB(
      BuildContext context, String title, String complain) async {
    try {
      await _firestore.collection('complaints').add({
        'title': title,
        'complain': complain,
        'createdAt': DateTime.now(),
        'givenBy': _auth.currentUser!.displayName.toString(),
      });
    } catch (e) {
      print(e);
    }

    _showToast2(context);
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Complaint submitted!'),
        action: SnackBarAction(
            label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showToast2(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Complaint submitted(admin))'),
        action: SnackBarAction(
            label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
