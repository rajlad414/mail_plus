import 'package:flutter/material.dart';
import 'package:mail_plus/widgets/widgets.dart';

import 'compose.dart';

class Unread extends StatefulWidget {
  const Unread({Key? key}) : super(key: key);

  @override
  _UnreadState createState() => _UnreadState();
}

class _UnreadState extends State<Unread> {
  List<Mail> mails = [
    // Mail(false, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15"),
    // Mail(true, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15"),
    // Mail(false, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15")
  ];

  bool isMessageRead = true;

  @override
  Widget build(BuildContext context) {
    if (mails.isEmpty)
      return Scaffold(
          drawer: CustomDrawer(),
          body: Column(
            children: [
              CustomAppBar("Unread", false),
              EmptyPage(),
            ],
          ),
          floatingActionButton: CustomFloatingActionButton(Icons.edit_rounded));
    else
      return Scaffold(
          drawer: CustomDrawer(),
          body: Column(
            children: [
              CustomAppBar("Unread", false),
              ListView.builder(
                itemCount: mails.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                itemBuilder: (context, index) {
                  return ConversationList(
                      mails[index].from,
                      mails[index].subject,
                      mails[index].message,
                      mails[index].time,
                      mails[index]._isread,
                      mails[index]._isarchived,
                      mails[index]._isinfo,
                      mails[index]._isimportant,
                      mails[index]._isfollowup,
                      mails[index].to);
                },
              ),
            ],
          ),
          floatingActionButton: CustomFloatingActionButton(Icons.edit_rounded));
  }
}

class Mail {
  bool _isread = false,
      _isarchived = false,
      _isinfo = false,
      _isimportant = false,
      _isfollowup = false;
  String from = "", message = "", subject = "", time = "";
  List<String> to = [];

  Mail(
      this._isread,
      this._isarchived,
      this._isinfo,
      this._isimportant,
      this._isfollowup,
      this.from,
      this.message,
      this.subject,
      this.to,
      this.time);
}
