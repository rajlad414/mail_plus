import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mail_plus/screens/inbox.dart';
import 'package:mail_plus/widgets/widgets.dart';

class Compose extends StatefulWidget {
  const Compose({Key? key}) : super(key: key);

  @override
  _ComposeState createState() => _ComposeState();
}

class _ComposeState extends State<Compose> {
  int _selectedIndex = 1;
  List<Mails> mails = [
    Mails(
        messageContent: "Respected Sir!\nWhen is the next meeting shedule Sir?",
        subject: "Regarding Meeting",
        messageType: "sender"),
    Mails(
        messageContent:
            "Hello XYZ,\n Due to busy shedule your meeting is postponed and further details we will share soon ",
        subject: "Regarding Meeting",
        messageType: "receiver"),
    Mails(
        messageContent: "Not an issue sir. Thank you",
        subject: "Regarding Meeting",
        messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: GradientContainer(
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'R'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Raj Lad",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "raj@gmail.com",
                          style: TextStyle(color: Colors.white60, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView.builder(
            itemCount: mails.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (mails[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (mails[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.grey),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          mails[index].subject,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          mails[index].messageContent,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              elevation: 5,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFFFF),
                          const Color(0xFFFFFFFF),
                        ],
                      )),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CustomFloatingActionButton(Icons.attach_file_rounded),
                          SizedBox(
                            width: 15,
                          ),
                          CustomFloatingActionButton(Icons.send_rounded),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TextField(
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                  hintText: "Enter the Subject..",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300)),
                                  focusColor: Colors.grey,
                                  hoverColor: Colors.grey,
                                  border: OutlineInputBorder()),
                            ),
                            TextField(
                              textAlign: TextAlign.justify,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                  hintText: "Write message...",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Mails {
  String messageContent;
  String messageType;
  String subject;
  Mails(
      {required this.messageContent,
      required this.subject,
      required this.messageType});
}
