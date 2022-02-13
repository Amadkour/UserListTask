import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled1/privacy/controllers/privacy_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: controller.obx(
                (data) => ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              color: Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7))),
                          child: Row(
                            children: [
                              Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      data![index].firstName.toString(),
                                      style: const TextStyle(
                                          fontFamily: 'SemiBold',
                                          fontSize: 18,
                                          color: Colors.black),
                                    )),
                                    Text(
                                      data[index].email.toString(),
                                      style: const TextStyle(
                                          fontFamily: 'SemiBold',
                                          fontSize: 16,
                                          color: Colors.blue),
                                    )
                                  ]),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  data![index].avatar.toString(),
                                  height: 50,
                                  width: 50,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: data!.length,
                    ),
                onEmpty: const Text(
                  'EmptyPage',
                  style: TextStyle(
                      fontFamily: 'SemiBold', fontSize: 16, color: Colors.blue),
                )),
          ),
        ),
        Row(children: [
          Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.pageNumber.value > 1) {
                    controller.pageNumber.value =
                        controller.pageNumber.value - 1;
                    controller.getUsersByPage();
                  }
                },
                child: const Text('Previous'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        controller.pageNumber.value == 1
                            ? Colors.grey[500]
                            : Colors.blue)),
              )),
          const Spacer(),
          Obx(() => Text(
                'Page Number : ' + controller.pageNumber.value.toString(),
                style: const TextStyle(
                    fontFamily: 'SemiBold', fontSize: 16, color: Colors.blue),
              )),
          const Spacer(),
          Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.isEmpty.value == false) {
                    controller.pageNumber.value =
                        controller.pageNumber.value + 1;
                    controller.getUsersByPage();
                  }
                },
                child: const Text('Next'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        controller.isEmpty.value
                            ? Colors.grey[500]
                            : Colors.blue)),
              )),
        ])
      ],
    ));
  }
}
