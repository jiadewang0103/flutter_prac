import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(home: MyHome(),));

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
//  List data = [];

  @override
  void initState() {
    super.initState();
  }

  getData() async {
    return http.get('https://jsonplaceholder.typicode.com/posts');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http+FutureBuilder'),),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snap) {
            if(!snap.hasData){
              return Container();
            }
            List data = jsonDecode(snap.data.body);
            print(data.length);
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext ctx, int idx) {
                  var d = data[idx];
                  return ListTile(
                    title: Text(d['title']), subtitle: Text(d['body']),);
                });

          }),
//      body: ListView.builder(
//        itemCount: data.length,
//          itemBuilder: (BuildContext cox, int idx){
//          var d = data[idx];
//          return ListTile(title: Text(d['title']), subtitle: Text(d['body']),);
//      }),
    );
  }
}
