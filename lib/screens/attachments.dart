import 'package:flutter/material.dart';
import 'package:mail_plus/widgets/mail.dart';
import 'package:mail_plus/widgets/widgets.dart';

class Attachments extends StatefulWidget {
  const Attachments({Key? key}) : super(key: key);

  @override
  _AttachmentsState createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
  List<Mail> mails=[

  ];
  bool isMessageRead = true;
  @override
  Widget build(BuildContext context) {
    if(mails.isEmpty) return Scaffold(
        drawer:CustomDrawer(),
        appBar: PreferredSize(preferredSize: Size.fromHeight(60.0),
            child: CustomAppBar("Attachments",false)),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image(
                    image: AssetImage("assets/empty-box.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You have no attachments over here.",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            )),
    );

    else return Scaffold(
        drawer: CustomDrawer(),
        appBar: PreferredSize(preferredSize: Size.fromHeight(60.0),
            child: CustomAppBar("Attachments",false)),
        body: Container()
    );
  }
}
