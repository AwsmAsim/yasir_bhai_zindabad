import 'dart:convert';
import 'package:get/get.dart';
import 'package:yasir_bhai_zindabad/model/message_model.dart';
import 'package:http/http.dart' as http;

class Inrteraction{
  String userMessage;
  String botMessage;
  Inrteraction({
    required this.userMessage,
    required this.botMessage
  } );
}

class MessageController extends GetxController{

  RxList<MessageModel> messages = <MessageModel>[].obs;
  List<Inrteraction> intMessages = [];
  int currentConversationindex = 0;
  int wrongMessageCount = 0;

  reset(){
    wrongMessageCount = 0;
    currentConversationindex = 0;
  }

  searchReplyForUser(String userMessage, String botMessage){
    for(var message in intMessages){
      if(message.botMessage == botMessage){
        if(userMessage == message.userMessage) addMessage(
          new MessageModel(name: "USER", message: intMessages[++currentConversationindex].botMessage, time: DateTime.now())
        );
        else {
          wrongMessageCount++;
          addMessage(new MessageModel(name: "USER", message: " Your reply was wrong", time: DateTime.now()));
          // if(wrongMessageCount > 10){
          //   addMessage("Your convo credits have expired");
          // }
        }
      }
    }
  }

  getMessageData() async{
    http.Response response = await http.get(Uri.parse("https://my-json-server.typicode.com/tryninjastudy/dummyapi/db"));
    intMessages = [];
    Map<String, dynamic> decodedData =  jsonDecode(response.body);
    for(var data in decodedData["restaurant"]){
      Inrteraction intMsg = Inrteraction(userMessage: data["bot"], botMessage: data["human"]);
      intMessages.add(intMsg);
    }
    return intMessages;
  }

  addMessage(MessageModel message){
    messages.add(message);
  }

}