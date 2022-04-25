import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/chat/chat_users_model.dart';

class ChatDetailController extends GetxController{
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  late ChatUsers chatUsers ;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    chatUsers = Get.arguments;
    super.onInit();
  }
}