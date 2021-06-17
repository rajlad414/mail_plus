import 'package:flutter/material.dart';
import 'package:mail_plus/screens/compose.dart';

class CustomFloatingActionButton extends StatelessWidget {
  IconData icon_name;
  CustomFloatingActionButton(this.icon_name);

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
                const Color(0xFF000000),
                const Color(0xFFFFFFFF),
              ],
            )),
        child: Icon(
          icon_name,
          color: Colors.white,
        ),
      ),
    );
    ;
  }
}
