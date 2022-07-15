import 'package:fixnoww/resources/firestore_resource.dart';
import 'package:fixnoww/utils/colors.dart';
import 'package:fixnoww/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class ClosedComplaintsList extends StatelessWidget {
  const ClosedComplaintsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().myClosedComplaints,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          backgroundColor: secondaryBackgroundColor,
          body: ListView.builder(
            itemBuilder: (context, position) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                    child: Column(children: [
                      Card(
                        color: Color.fromARGB(255, 243, 84, 72),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 75,
                            child: Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${(snapshot.data! as dynamic).docs[position]['title']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[position]['createdAt'].toDate())}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        '${DateFormat.Hm().format((snapshot.data! as dynamic).docs[position]['createdAt'].toDate())}',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ],
              );
            },
            itemCount: (snapshot.data! as dynamic).docs.length,
          ),
        );
      },
    );
  }
}
