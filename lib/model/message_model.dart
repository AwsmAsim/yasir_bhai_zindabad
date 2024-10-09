class MessageModel{

  String name;
  String message;
  DateTime time;
  String? baapKaNaam;
  bool myMessage;

  MessageModel({
    required this.name,
    required this.message,
    required this.time,
    this.baapKaNaam,
    this.myMessage = true
  });


}