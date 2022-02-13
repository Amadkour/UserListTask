import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/privacy/controllers/privacy_controller.dart';
import 'package:untitled1/privacy/views/user_view.dart';



void main() {
  Get.lazyPut(()=>UserController());
  runApp(const MyApp());
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
