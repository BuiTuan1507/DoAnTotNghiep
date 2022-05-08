import 'package:flutter/cupertino.dart';

class ChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  bool isRead;
  int newMessageCount;
  ChatUsers({required this.name,required this.messageText,required this.imageURL,required this.time, required this.isRead, required this.newMessageCount});
}

class ChatMessage{
  String messageContent;
  String messageType;
  bool sendMessageStatus = false;
  ChatMessage({required this.messageContent, required this.messageType, required this.sendMessageStatus});
}