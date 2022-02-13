import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/privacy/controllers/privacy_controller.dart';
import 'package:untitled1/privacy/views/user_view.dart';


sortList(List<int> a, List<int> b){
  int i = a.length - 1;
  int j = 4 - 1;
  int resultPos =  a.length + 4 - 1;
  while (i >= 0 || j >= 0) {
    if (j < 0 || (i >= 0 && a[i] >= b[j])) {
      b[resultPos--] = a[i--];
    } else {
      b[resultPos--] = b[j--];
    }
  }
  return b;
}

void main() {

print(sortList([1,2,4], [4,5,7,13,0,0,0]));

  // Get.lazyPut(()=>UserController());
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const UserView(),
    );
  }
}
