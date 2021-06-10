// @dart=2.9
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

import '../screens/read.dart';

class ConversationList extends StatefulWidget {
  String from, subject, message, time;
  bool _isread, _isarchived, _isinfo, _isimportant, _isfollowup;
  List<String> to;

  ConversationList(
      this.from,
      this.subject,
      this.message,
      this.time,
      this._isread,
      this._isarchived,
      this._isinfo,
      this._isimportant,
      this._isfollowup,
      this.to);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Read(
              widget.from,
              widget.subject,
              widget.message,
              widget.time,
              widget._isread,
              widget._isarchived,
              widget._isinfo,
              widget._isimportant,
              widget._isfollowup,
              widget.to);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        widget.from[0].toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.from,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.subject,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget._isread
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      widget._isread ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  String title;

  CustomAppBar(this.title, this.popupVisible);

  bool popupVisible;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearching = false;
  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
    });
  }

  Widget _appBar() {
    return InkWell(
      child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu, color: Colors.white, size: 24),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          // fontWeight: FontWeight.w900
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      PopupMenuButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'All',
                              child: Text('All'),
                            ),
                            PopupMenuItem(
                              value: 'Unread',
                              child: Text('Unread'),
                            ),
                            PopupMenuItem(
                              value: 'Attachments',
                              child: Text('Attachments'),
                            ),
                            PopupMenuItem(
                              value: 'Archived',
                              child: Text('Archived'),
                            ),
                            PopupMenuItem(
                              child: Text(
                                "FLAGGED",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              enabled: false,
                            ),
                            PopupMenuItem(
                              value: 'All Flagged',
                              child: Text('All Flagged'),
                            ),
                            PopupMenuItem(
                              value: 'Info',
                              child: Text('Info'),
                            ),
                            PopupMenuItem(
                              value: 'Important',
                              child: Text('Important'),
                            ),
                            PopupMenuItem(
                              value: 'Follow-up',
                              child: Text('Follow-up'),
                            ),
                            PopupMenuItem(
                              child: Text(
                                "TAG",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              enabled: false,
                            ),
                            PopupMenuItem(
                              value: 'Notification',
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Notification'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'Newsletter',
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Newsletter'),
                                ],
                              ),
                            ),
                          ];
                        },
                        // onSelected: (String value) => actionPopUpItemSelected(value, name),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search, size: 24, color: Colors.white),
                    onPressed: _startSearch,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Visibility(
                    visible: widget.title == "Spam",
                    child: IconButton(
                      icon: Icon(Icons.mark_email_unread_rounded,
                          size: 24, color: Colors.white),
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible:
                                false, // user must tap button for close dialog!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Empty Spam?'),
                                content: const Text(
                                    'This will remove all your Spam mail.'),
                                actions: <Widget>[
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {},
                                  ),
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Visibility(
                    visible: widget.title == "Trash",
                    child: IconButton(
                      icon: Icon(Icons.delete_forever_rounded,
                          size: 24, color: Colors.white),
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible:
                                false, // user must tap button for close dialog!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Empty Trash?'),
                                content: const Text(
                                    'This will remove all your deleted mail from your device.'),
                                actions: <Widget>[
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {},
                                  ),
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget _searchField() {
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white70),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: false,
      leading: _isSearching ? BackButton() : null,
      title: _isSearching ? _searchField() : _appBar(),
    );
  }
}

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
          "You have no mails over here.",
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool foldersView = true, tagsView = true, viewsViews = true, drawerView=true;

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

  void drawer(){
    setState(() {
      drawerView=!drawerView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25, top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.person_pin_rounded,color: Colors.white,size: 25,)),
                    IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return Calender();
                          }));
                        },
                        icon: Icon(Icons.calendar_today_rounded,color: Colors.white,size: 25,)),
                    IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Attachments();
                        }));
                      },
                        icon: Icon(Icons.archive_rounded,color: Colors.white,size: 25,)),
                    IconButton(icon: Icon(Icons.settings,color: Colors.white,size: 25,))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
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
                      padding: const EdgeInsets.only(left: 10.0,top: 10,bottom: 5),
                      child: Text("OnePercent",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,bottom: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("onepercent.club",style: TextStyle(color: Colors.white,fontSize: 12,)),
                          drawerView?Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ):Icon(
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
        drawerView?
        Column(
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Inbox();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Draft'),
                    leading: Icon(Icons.drafts),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Draft();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Templates'),
                    leading: Icon(Icons.note_sharp),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Templates();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Sent'),
                    leading: Icon(Icons.send_rounded),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Sent();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Spam'),
                    leading: Icon(Icons.report_gmailerrorred_rounded),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Spam();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Trash'),
                    leading: Icon(Icons.delete),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Trash();
                        }));
                      },
                  ),
                  ListTile(
                    title: Text('Outbox'),
                    leading: Icon(Icons.outbox),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Outbox();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('NewsLetter'),
                    leading: Icon(Icons.folder),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return NewsLetter();
                        }));
                      },
                  ),
                  ListTile(
                    title: Text('Notification'),
                    leading: Icon(Icons.folder),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
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
                      height:20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.yellow),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Unread();
                        }));
                      },
                  ),
                  ListTile(
                    title: Text('Flagged'),
                    leading: Icon(Icons.flag),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Flagged();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Offline Emails'),
                    leading: Icon(Icons.mark_email_read),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return OfflineMails();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ):
            Column(
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
                            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                                ? Colors.blue
                                : Colors.white,
                            backgroundImage: ExactAssetImage('assets/images/op.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text("OnePercent",style: TextStyle(color: Colors.grey,fontSize: 14, fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("onepercent.club",style: TextStyle(color: Colors.grey,fontSize: 10,))

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
                        Icon(Icons.add, size:20),
                        SizedBox(width: 15,),
                        Text("Add Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
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
