import 'package:flutter/material.dart';
import 'package:patterns_mobx/stores/update_store.dart';

class UpdatePage extends StatefulWidget {
  final  String title;
  final String  body;
  final int id;
  const UpdatePage({Key key,  this.title,  this.body,  this.id}) : super(key: key);
  static String id1  = "update_page";

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  UpdateStore store = new UpdateStore();

  @override
  void initState() {
    super.initState();
    store.titleController.text = widget.title;
    store.bodyController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Post",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(child: texField(labelText: "Title", controller: store.titleController)),
            SizedBox(
              height: 30,
            ),
            Container(child: texField(labelText: "Body", controller: store.bodyController)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ))),
              onPressed: () async {
                store.updatePostList(context: context, id: widget.id);
              },
              child: Text(
                "Add",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget texField({labelText, controller}) {
    return TextField(
      decoration: InputDecoration(
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
    );
  }
}