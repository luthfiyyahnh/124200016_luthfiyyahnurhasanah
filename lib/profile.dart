import 'dart:html';

import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);
  static String tag = "profile-page";
  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Anda"),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: Text("data"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
