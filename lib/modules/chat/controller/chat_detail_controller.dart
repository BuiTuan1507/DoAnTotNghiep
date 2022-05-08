import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/chat/chat_users_model.dart';

class ChatDetailController extends GetxController{
  RxList<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver", sendMessageStatus: false),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver", sendMessageStatus: false),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender", sendMessageStatus: false),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver", sendMessageStatus: false),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender", sendMessageStatus: false),
  ].obs;

  late ChatUsers chatUsers ;

  final TextEditingController textEditingController = TextEditingController();

  List<File> fileImage = <File>[];

  @override
  void onInit() {
    chatUsers = Get.arguments;
    super.onInit();
  }
}