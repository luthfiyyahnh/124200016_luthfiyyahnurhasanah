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
    final alucard = Hero(
      tag: 'hero',
      child: Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Padding(
        padding: EdgeInsets.all(50.0),
        child: CircleAvatar(
          radius: 200.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          'Sistem Informasi',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          '124200016',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      ],


    )),
    );

    final body = Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(70.0),
    decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
    Colors.blue,
    Colors.lightBlueAccent,
    ]),
    ),
    child: Column(
    children: <Widget>[
    alucard,
    ],
    ),
    );
    return Scaffold(
    appBar: AppBar(
    title: const Text('Luthfiyyah Nur Hasannah'),
    ),
    body: body,
    );
  }
}
