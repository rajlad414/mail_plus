import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mail_plus/screens/inbox.dart';

class Compose extends StatefulWidget {
  const Compose({Key? key}) : super(key: key);

  @override
  _ComposeState createState() => _ComposeState();
}

class _ComposeState extends State<Compose> {
  bool bccCc=false;
  bool isChecked = false;
  void bccCcVisible(){
    setState(() {
      bccCc=!bccCc;
    });
  }
  void makeCheck(){
    setState(() {
      isChecked=!isChecked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        title: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "Compose",
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ), onPressed: () {  },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                    ), onPressed: () {  },
                  ),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'Add Bcc/Cc',
                          child: bccCc?Text('Remove Bcc/Cc'):Text('Add Bcc/Cc'),
                        ),
                        PopupMenuItem(
                          value: 'Insert Templates',
                          child: Text('Insert Templates'),
                        ),
                        PopupMenuItem(
                          value: 'Priority',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Priority"),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size:14,
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Ask Receipt',
                          child: GestureDetector(
                            onTap: makeCheck,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ask Receipt'),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                    onSelected: (String value) {
                      if(value=="Add Bcc/Cc") bccCcVisible();
                      if(value=="Insert Templates") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                          return Inbox();
                        }));
                      }
                      if(value=="Ask Receipt"){
                        setState(() {
                          isChecked = !isChecked;
                        });
                      }
                      if(value=="Priority"){
                      List<String> pri=["High","Medium","Low"];
                      showDialog<String>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: const Text('Select Priority'),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                      },
                                      child: const Text('High'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                      },
                                      child: const Text('Medium'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                      },
                                      child: const Text('Low'),
                                    ),
                                  ],
                                );
                              });
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "From",
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "To",
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
            ),
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: bccCc,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Cc",
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: bccCc,
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                labelText: "Bcc",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Subject",
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            textAlign: TextAlign.justify,
            scrollPadding: EdgeInsets.all(8),
            selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Compose",
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
        ],
      )),
    );
  }
}
