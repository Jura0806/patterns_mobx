import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:patterns_mobx/models/post_model.dart';
import 'package:patterns_mobx/services/http_service.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {

  Random random = new Random();
  @observable bool isLoading = false ;
  Post post;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  Future<bool> createPostList() async {
    post = Post(title: titleController.text, body: bodyController.text, userId: random.nextInt(10));
    isLoading = true;
    var response =
    await Network.POST(Network.API_Create, Network.paramsCreate(post));
    isLoading = false;
    print("CreatePost => $response");
    return response != null ;
  }


}