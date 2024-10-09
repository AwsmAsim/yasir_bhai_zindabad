import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasir_bhai_zindabad/model/message_model.dart';

import '../controller/message_controller.dart';

class MessageScreen extends StatelessWidget {


  MessageController messageController = Get.find();

  @override
  Widget build(BuildContext context) {

    print("Build loaded");
    return PopScope(
      onPopInvokedWithResult: (_, a){
        messageController.reset();
      },
      child: Scaffold(
        appBar: AppBar(
      // back icon -> reset

        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async{
              messageController.getMessageData();
            },
            child: Container(
              color: Colors.green,
              child: Icon(Icons.add, color: Colors.white,),
            ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GetX<MessageController>(
                builder: (widgetController){
                  print("Message widget reloaded");
                  return Column(
                    children: [
                      for(var message in widgetController.messages)
                        Column(
                          children: [
                            ListTile(
                              title: Text("Message: ${message.message}"),
                              subtitle: Text("by: ${message.name}"),
                            )
                          ],
                        )
                    ],
                  );
                },
              ),
            ),

            SizedBox(
              height: 100,
              width: double.infinity,
              child: InkWell(
                onTap: (){
                  MessageModel messageModel = MessageModel(
                      name: "Modiji",
                      message: "Sorry Yashoda behen",
                      time: DateTime.now(),
                    baapKaNaam: "Nahi pata"
                  );
                  messageController.addMessage(messageModel);
                },
                child: Container(
                  color: Colors.green,
                  child: Text('Send Message'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
