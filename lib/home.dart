import 'dart:convert';
import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          var Boxfit;
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _posts[index]["urlToImage"] != null
                  ? Image.network(
                      _posts[index]["urlToImage"],
                      width: 100,
                      height: 50,
                      fit: Boxfit,
                    )
                  : Center(),
            ),
            title: Text(
              '${_posts[index]['title']}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_posts[index]['description']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => Detail(
                    url: _posts[index]['url'],
                    title: _posts[index]['title'],
                    content: _posts[index]['content'],
                    publishedAt: _posts[index]['publishedAt'],
                    author: _posts[index]['author'],
                    urlToImage: _posts[index]['urlToImage'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=b06545ace14c45a2a94eb5dde023cd2b'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
