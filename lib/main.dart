import 'package:flutter/material.dart';
import 'package:yasir_bhai_zindabad/controller/message_controller.dart';
import 'package:get/get.dart';
import 'package:yasir_bhai_zindabad/view/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
