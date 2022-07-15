import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String btn1text;
  final String btn2text;
  final VoidCallback onPressedbtn1;
  final VoidCallback onPressedbtn2;
  const CustomDialog(
      {Key? key,
      required this.btn1text,
      required this.btn2text,
      required this.content,
      required this.onPressedbtn1,
      required this.onPressedbtn2,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Sign out"),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                ElevatedButton(onPressed: onPressedbtn1, child: Text(btn1text)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    onPressed: onPressedbtn2,
                    child: Text(btn2text)),
              ],
            );
          },
        );
      },
    );
  }
}
