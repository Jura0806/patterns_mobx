import 'package:mobx/mobx.dart';
import 'package:patterns_mobx/models/post_model.dart';
import 'package:patterns_mobx/services/http_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{

 @observable List<Post> items = [];
 @observable bool isLoading = false;

  Future apiPostList() async {
    var response = await Network.GET(Network.API_List, Network.paramsEmpty());
    print(response);
    isLoading = true;
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    print("++++++++");
    //print(items);
  }

  Future<bool> deletePostList(Post post) async {
    isLoading = false;
    var response = await Network.Del(Network.API_Delete + post.id.toString(), Network.paramsEmpty());
    print("DeletePost => ${response.toString()}");
    isLoading = true;
    return response != null;
  }

}
