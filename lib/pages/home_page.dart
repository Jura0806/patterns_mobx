import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patterns_mobx/stores/home_store.dart';
import 'package:patterns_mobx/views/item_of_post.dart';

import 'create_post_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeStore store = new HomeStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobX"),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            ListView.builder(
              itemCount: store.items.length,
              itemBuilder: (ctx, i) {
                return itemOfList(context,store, store.items[i]);
              },
            ),
            store.isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePost()));
        },
      ),
    );
  }
}
