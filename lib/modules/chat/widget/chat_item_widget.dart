import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../models/chat/chat_users_model.dart';
import '../page/chat_detail_page.dart';



class ChatItemWidget extends StatefulWidget{
  final ChatUsers chatUser;
  const ChatItemWidget({required this.chatUser});
  @override
  _ChatItemWidgetState createState() => _ChatItemWidgetState();
}

class _ChatItemWidgetState extends State<ChatItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouterLink.chatDetailPage, arguments: widget.chatUser);
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.chatUser.imageURL),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.chatUser.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.chatUser.messageText,style: TextStyle(fontSize: 13,color: Colors.black, fontWeight: widget.chatUser.isRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.chatUser.time,style: TextStyle(fontSize: 12,fontWeight: widget.chatUser.isRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}