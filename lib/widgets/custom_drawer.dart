import 'package:flutter/material.dart';

import 'package:mail_plus/screens/attachments.dart';
import 'package:mail_plus/screens/calender.dart';
import 'package:mail_plus/screens/draft.dart';
import 'package:mail_plus/screens/flagged.dart';
import 'package:mail_plus/screens/inbox.dart';
import 'package:mail_plus/screens/newsletter.dart';
import 'package:mail_plus/screens/notification.dart';
import 'package:mail_plus/screens/offline_emails.dart';
import 'package:mail_plus/screens/outbox.dart';
import 'package:mail_plus/screens/sent.dart';
import 'package:mail_plus/screens/spam.dart';
import 'package:mail_plus/screens/templates.dart';
import 'package:mail_plus/screens/trash.dart';
import 'package:mail_plus/screens/unread.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool foldersView = true,
      tagsView = true,
      viewsViews = true,
      drawerView = true;

  void folder() {
    setState(() {
      foldersView = !foldersView;
    });
  }

  void tag() {
    setState(() {
      tagsView = !tagsView;
    });
  }

  void view() {
    setState(() {
      viewsViews = !viewsViews;
    });
  }

  void drawer() {
    setState(() {
      drawerView = !drawerView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              const Color(0xFF380036),
              const Color(0xFF0cbaba),
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25, top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.person_pin_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Calender();
                          }));
                        },
                        icon: Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.white,
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Attachments();
                          }));
                        },
                        icon: Icon(
                          Icons.archive_rounded,
                          color: Colors.white,
                          size: 25,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  backgroundImage: ExactAssetImage('assets/images/op.png'),
                  radius: 35,
                ),
              ),
              GestureDetector(
                onTap: drawer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, top: 10, bottom: 5),
                      child: Text(
                        "OnePercent",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, bottom: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("onepercent.club",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
                          drawerView
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        drawerView
            ? Column(
                children: [
                  GestureDetector(
                    onTap: folder,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "FOLDERS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        foldersView
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.grey,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: foldersView,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Inbox'),
                          leading: Icon(Icons.inbox),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Inbox();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Draft'),
                          leading: Icon(Icons.drafts),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Draft();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Templates'),
                          leading: Icon(Icons.note_sharp),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Templates();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Sent'),
                          leading: Icon(Icons.send_rounded),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Sent();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Spam'),
                          leading: Icon(Icons.report_gmailerrorred_rounded),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Spam();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Trash'),
                          leading: Icon(Icons.delete),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Trash();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Outbox'),
                          leading: Icon(Icons.outbox),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Outbox();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('NewsLetter'),
                          leading: Icon(Icons.folder),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return NewsLetter();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Notification'),
                          leading: Icon(Icons.folder),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Notifications();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: tag,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "TAGS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        tagsView
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.grey,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: tagsView,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Notifications'),
                          leading: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.yellow),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Notifications();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('NewsLetter'),
                          leading: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.yellow),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return NewsLetter();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: view,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Views",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        viewsViews
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.grey,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                              )
                      ],
                    ),
                  ),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: viewsViews,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Unread'),
                          leading: Icon(Icons.mark_email_unread),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Unread();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Flagged'),
                          leading: Icon(Icons.flag),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Flagged();
                            }));
                          },
                        ),
                        ListTile(
                          title: Text('Offline Emails'),
                          leading: Icon(Icons.mark_email_read),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return OfflineMails();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).platform ==
                                      TargetPlatform.iOS
                                  ? Colors.blue
                                  : Colors.white,
                              backgroundImage:
                                  ExactAssetImage('assets/images/op.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "OnePercent",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("onepercent.club",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Icon(Icons.add, size: 20),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Add Account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
      ]),
    );
  }
}
