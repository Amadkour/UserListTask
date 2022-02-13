import 'package:get/get.dart';
import 'package:untitled1/privacy/providers/Api/privacy_provider.dart';
import 'package:untitled1/privacy/providers/model/user.dart';

class UserController extends GetxController with StateMixin<List<User>> {
  RxInt pageNumber=1.obs;
  RxBool isEmpty=false.obs;
  @override
  void onInit() {
    getUsersByPage();
    super.onInit();
  }

  getUsersByPage() {
    print(pageNumber.value);
    change(null, status: RxStatus.loading());
    UserAPI().getAllUsers(page: pageNumber.value).then((value) {
      if(value.isEmpty){
        change([], status: RxStatus.empty());
        isEmpty.value=true;
      }else{
        change(value, status: RxStatus.success());
        isEmpty.value=false;
      }

    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
