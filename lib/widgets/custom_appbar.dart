import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  String title;

  CustomAppBar(this.title, this.popupVisible);

  bool popupVisible;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color(0xFF380036),
                const Color(0xFF0cbaba),
              ],
              begin: const FractionalOffset(0.0, 1.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 35)),
            new Padding(
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
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                        ),
                        PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
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
                        ),
                      ],
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search ...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
