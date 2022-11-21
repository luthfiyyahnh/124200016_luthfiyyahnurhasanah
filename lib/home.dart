import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Http')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: Text('image'),
            ),
            title: Text('title'),
            subtitle: Text('subtitle'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) => Detail()));
            },
          );
        },
      ),
    );
  }
  Future _getData() async {
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=id&apiKey=b06545ace14c45a2a94eb5dde023cd2b'));

      if(response.statusCode == 200){
        print(response.body);
      }
    }catch (e) {
    }

    }

}

