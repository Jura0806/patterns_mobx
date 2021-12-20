import 'package:flutter/material.dart';
import 'package:patterns_mobx/pages/create_post_page.dart';
import 'package:patterns_mobx/pages/home_page.dart';
import 'package:patterns_mobx/pages/update_post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id : (context) => HomePage(),
        CreatePost.id : (context) => CreatePost(),
        UpdatePage.id1 : (context) => UpdatePage()
      },
    );
  }
}
