
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/chat/chat_users_model.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';
import '../widget/avatar_widget.dart';

class ChatDetailPage extends GetView<ChatDetailController>{
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarChatDetail(),
      body: Stack(
        children: <Widget>[

          Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics:
                  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

                  children: List.generate(controller.messages.length, (index) =>  Container(
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (controller.messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (controller.messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(controller.messages[index].messageContent, style: TextStyle(fontSize: 15),),
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),


          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.textEditingController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      String message = controller.textEditingController.text.trim();
                      ChatMessage chatMessage = ChatMessage(messageContent: message, messageType: "sender");
                      controller.messages.add(chatMessage);
                      controller.textEditingController.clear();
                      FocusScope.of(context).unfocus();
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarChatDetail(){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: size(22),
                ),
              ),
              SizedBox(
                width: width(2),
              ),
              buildAvatarUser(imageUrl: '', size: 40),
              SizedBox(
                width: width(12),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      controller.chatUsers.name,
                      style: AppStyles.textNormalBlackMedium,
                    ),
                    SizedBox(
                      height: height(6),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height:height(8),
                          width: height(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greenMoney
                          ),
                        ),
                        SizedBox(width: width(8),),
                        Text(
                          "Đang hoạt động",
                          style:AppStyles.textTinyStrongDarkRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.settings,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

}