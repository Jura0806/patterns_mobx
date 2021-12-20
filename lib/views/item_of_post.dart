
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_mobx/models/post_model.dart';
import 'package:patterns_mobx/pages/update_post_page.dart';
import 'package:patterns_mobx/stores/home_store.dart';

Widget itemOfList(BuildContext context, HomeStore store, Post post) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
    actions: [
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(title: post.title,body: post.body,id: post.id,)));
        },
      ),
    ],
    secondaryActions: [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
          store.deletePostList(post).then((value) => {
            if(value){
              store.apiPostList()
            }
          });
        },
      )
    ],
  );
}