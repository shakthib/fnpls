// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:fixnoww/resources/firestore_resource.dart';
import 'package:fixnoww/utils/colors.dart';
import 'package:fixnoww/utils/utils.dart';
import 'package:fixnoww/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewComplaintScreen extends StatefulWidget {
  const NewComplaintScreen({Key? key}) : super(key: key);

  @override
  State<NewComplaintScreen> createState() => _NewComplaintScreenState();
}

class _NewComplaintScreenState extends State<NewComplaintScreen> {
  late TextEditingController titleController;
  late TextEditingController complaintController;

  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  @override
  void initState() {
    titleController = TextEditingController();
    complaintController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    complaintController.dispose();
  }

  submitComplaint() async {
    _firestoreMethods.addComplaintToUserDB(
        context, titleController.text, complaintController.text);

    _firestoreMethods.addComplaintToAdminDB(
        context, titleController.text, complaintController.text);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New complaint"),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    "What's the problem?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLength: 30,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Title',
                        hintText: 'Complaint title',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: complaintController,
                      maxLength: 350,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Complaint',
                        hintText: 'Describe your complaint',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: submitComplaint,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add complaint",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.add),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: buttonColor,
                          alignment: Alignment.centerLeft,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: buttonColor),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
