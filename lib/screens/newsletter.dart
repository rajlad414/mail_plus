import 'package:flutter/material.dart';
import 'package:mail_plus/widgets/widgets.dart';

import 'compose.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({Key? key}) : super(key: key);

  @override
  _NewsLetterState createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {

  List<Mail> mails=[
    // Mail(false, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15"),
    // Mail(true, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15"),
    // Mail(false, false, false, false, false, "raj@gmail.com", "Hello Sir,\nMyself Raj,\nSir Due to heavy rain please allow us holiday sir", "Request For Holiday", ["md@gmail.com"],"2:15")
  ];

  bool isMessageRead = true;

  @override
  Widget build(BuildContext context) {
    if(mails.isEmpty) return Scaffold(
        drawer:CustomDrawer(),
        appBar: PreferredSize(preferredSize: Size.fromHeight(60.0),
            child: CustomAppBar("NewsLetter",true)),
        body: EmptyPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) {
                  return Compose();
                }));
          },
          child: Icon(
            Icons.edit_rounded,
            color: Colors.white,
          ),
        )
    );

    else return Scaffold(
        drawer: CustomDrawer(),
        appBar: PreferredSize(preferredSize: Size.fromHeight(60.0),
            child: CustomAppBar("NewsLetter",true)),
        body: ListView.builder(
          itemCount: mails.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16),
          itemBuilder: (context, index){
            return ConversationList(mails[index].from,
                mails[index].subject,
                mails[index].message,
                mails[index].time,
                mails[index]._isread,
                mails[index]._isarchived,
                mails[index]._isinfo,
                mails[index]._isimportant,
                mails[index]._isfollowup,
                mails[index].to
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) {
                  return Compose();
                }));
          },
          child: Icon(
            Icons.edit_rounded,
            color: Colors.white,
          ),
        )
    );
  }
}

class Mail{
  bool _isread=false, _isarchived=false, _isinfo=false, _isimportant=false, _isfollowup=false;
  String from="", message="", subject="",time="";
  List<String> to=[];

  Mail(this._isread, this._isarchived, this._isinfo, this._isimportant,
      this._isfollowup, this.from, this.message, this.subject, this.to,this.time);
}
