// @dart=2.9
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mail_plus/widgets/widgets.dart';

class Read extends StatefulWidget {
  String from, subject, message, time;
  bool _isread, _isarchived, _isinfo, _isimportant, _isfollowup;
  List<String> to;

  Read(
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
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  bool toMeVisible = false, contentVisible = true;
  void contentWidget() {
    setState(() {
      contentVisible = !contentVisible;
    });
  }

  void toMeWidget() {
    setState(() {
      toMeVisible = !toMeVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        flexibleSpace: GradientContainer(null),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            IconButton(onPressed: () {}, icon: Icon(Icons.archive_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.reply)),
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'Reply All',
                    child: Text('Reply All'),
                  ),
                  PopupMenuItem(
                    value: 'Forward',
                    child: Text('Forward'),
                  ),
                  PopupMenuItem(
                    value: 'Move',
                    child: Text('Move'),
                  ),
                  PopupMenuItem(
                    value: 'Flag',
                    child: Text('Flag'),
                  ),
                  PopupMenuItem(
                    value: 'Spam',
                    child: Text('Spam'),
                  ),
                  PopupMenuItem(
                    value: 'Tag',
                    child: Text('Tag'),
                  ),
                  PopupMenuItem(
                    value: 'Save Offline',
                    child: Text('Save Offline'),
                  ),
                  PopupMenuItem(
                    value: 'Print',
                    child: Text('Print'),
                  ),
                ];
              },
              // onSelected: (String value) => actionPopUpItemSelected(value, name),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(widget.subject,
                style: TextStyle(fontSize: 24),
                maxLines: 4,
                minFontSize: 14,
                overflow: TextOverflow.ellipsis),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: contentWidget,
              child: Container(
                padding: EdgeInsets.only(left: 10),
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
                                  Row(
                                    children: [
                                      Text(
                                        widget.time,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Inbox",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  GestureDetector(
                                      onTap: toMeWidget,
                                      child: Text(
                                        "to Me",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: toMeVisible,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "From: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          widget.from,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          "To: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.to[0],
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: contentVisible,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.message,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
