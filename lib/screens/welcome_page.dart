// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail_plus/screens/register_page.dart';
import 'package:mail_plus/screens/signin_page.dart';
import 'package:mail_plus/widgetss/my_text_button.dart';
import '../widgetss/constants.dart';
import '../widgetss/widget.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          foregroundColor: Colors.white,
                          radius: 100,
                          backgroundImage: AssetImage('assets/images/op.png'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Mail+",
                        style: kHeadline,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          "Use the Mail app to write, reply to, and organize your email",
                          style: kBodyText,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyTextButton(
                          bgColor: Colors.blue,
                          buttonName: 'Register',
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          textColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: MyTextButton(
                          bgColor: Colors.transparent,
                          buttonName: 'Sign In',
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          },
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
