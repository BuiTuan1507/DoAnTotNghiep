import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/chat/chat_users_model.dart';

class ChatController extends GetxController{

  RxInt currentIndex = 0.obs;

  final TextEditingController controller = TextEditingController();
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "assets/images/userImage1.jpg", time: "Now" , isRead: false, newMessageCount: 0),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "assets/images/userImage2.jpg", time: "Yesterday", isRead: true, newMessageCount: 2),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "assets/images/userImage2.jpg", time: "31 Mar" ,isRead: false, newMessageCount: 0),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "assets/images/userImage2.jpg", time: "28 Mar",isRead: true, newMessageCount: 3),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "assets/images/userImage2.jpg", time: "23 Mar",isRead: false, newMessageCount: 0),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "assets/images/userImage2.jpg", time: "17 Mar",isRead: false, newMessageCount: 1),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "assets/images/userImage2.jpg", time: "24 Feb",isRead: false, newMessageCount: 0),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "assets/images/userImage2.jpg", time: "18 Feb",isRead: false, newMessageCount: 0),
  ];
  List<ChatUsers> listChat = [];
  @override
  void onInit() {
    listChat = chatUsers;
    super.onInit();
  }
  void search(String text){
    List<ChatUsers> listChatSearch = [];
    for (var element in chatUsers) {
      if(element.name.contains(text)){
        listChatSearch.add(element);
      }else {
        String firstCharacter =  text.substring(0,1).toUpperCase();
        if(text.length > 1) {
          text = firstCharacter + text.substring(1,text.length);
        }else {
          text = firstCharacter;
        }
        if(element.name.contains(text)) {
          listChatSearch.add(element);
        }
      }

    }
    if(text == "") listChat = chatUsers;
    listChat = listChatSearch;
  }
}