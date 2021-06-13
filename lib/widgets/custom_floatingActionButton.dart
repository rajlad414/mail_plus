import 'package:flutter/material.dart';
import 'package:mail_plus/screens/compose.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton() : super();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Compose();
        }));
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color(0xFF380036),
                const Color(0xFF0cbaba),
              ],
            )),
        child: Icon(
          Icons.edit_rounded,
          color: Colors.white,
        ),
      ),
    );
    ;
  }
}
