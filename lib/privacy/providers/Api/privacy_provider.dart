import 'package:get/get.dart';
import 'package:untitled1/privacy/providers/model/user.dart';

class UserAPI extends GetConnect {

  Future<List<User>> getAllUsers({int page=1}) async {
    Response res=await get('https://reqres.in/api/users?page=$page');
    List<User> l=[];
    res.body['data'].forEach((e)=>l.add(User.fromJson(e)));
    return l;

}
}
