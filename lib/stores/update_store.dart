import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:patterns_mobx/models/post_model.dart';
import 'package:patterns_mobx/pages/home_page.dart';
import 'package:patterns_mobx/services/http_service.dart';

part 'update_store.g.dart';

class UpdateStore = _UpdateStore with _$UpdateStore;

abstract class _UpdateStore with Store {

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  @observable bool isLoading = false;
  Random random = new Random();


  void updatePostList({int id, BuildContext context}) async {
    Post post = Post(title: titleController.text, body: bodyController.text, userId: random.nextInt(10));
    isLoading = true;
    var response =
    await Network.PUT(Network.API_Update + id.toString(), Network.paramsUpdate(post));
    print(response);
      if(response != null){
        Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      }
      isLoading = false;
    print("CreatePost => $response");
  }
}
