import 'package:flutter/material.dart';
import 'package:mail_plus/screens/read.dart';

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
