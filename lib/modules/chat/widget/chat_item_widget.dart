import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/config.dart';
import '../../../models/chat/chat_users_model.dart';
import '../../../utils/common/screen_utils.dart';
import '../../../utils/utils.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: buildAvatarUser(imageUrl: '')),
            SizedBox(width: width(10),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNameItem(widget.chatUser),
                  SizedBox(height: height(4),),
                  buildNameProduct(),
                  SizedBox(height: height(4),),
                  buildLastMessage(widget.chatUser)
                ],
              ),
            ),
            SizedBox(width: width(10),),
            buildAvatarProduct(imageUrl: '')
          ],
        ),
      ),
    );
  }

  Widget buildAvatarUser({required String imageUrl}){
    return (imageUrl != "")
        ? CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, image) {
        return Container(
          height: width(60),
          width: width(60),
          decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
              shape: BoxShape.circle
          ),
        );
      },
      placeholder: (context, image) {
        return Container(
          height: width(60),
          width: width(60),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(Constants.AVATAR_URL),
                  fit: BoxFit.cover),
              shape: BoxShape.circle),
        );
      },
    )
        : Container(
      height: width(60),
      width: width(60),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(Constants.AVATAR_URL),
              fit: BoxFit.cover),
          shape: BoxShape.circle),
    );
  }

  Widget buildAvatarProduct({required String imageUrl}){
    return (imageUrl != "")
        ? CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, image) {
        return Container(
          height: width(60),
          width: width(40),
          decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5)
          ),
        );
      },
      placeholder: (context, image) {
        return Container(
          height: width(60),
          width: width(40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(Constants.PRODUCT_URL),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5)
          ),
        );
      },
    )
        : Container(
      height: width(60),
      width: width(40),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(Constants.PRODUCT_URL),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }


  Widget buildNameItem(ChatUsers chatUsers) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            chatUsers.name,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sarabun(
                fontWeight: FontWeight.w600,
                fontSize: size(16),
                fontStyle: FontStyle.normal),
            maxLines: 1,
            softWrap: true,
          ),
        ),
        buildTimeItem(chatUsers)
      ],
    );
  }

  Widget buildNameProduct() {
    return Container(
      padding: EdgeInsets.only(right: width(15)),
      child: Text(
        "Xe đạp điện",
        overflow: TextOverflow.ellipsis,
        style: AppStyles.textNormalDarkSemiBold,
        maxLines: 1,
        softWrap: true,
      )
    );
  }

  Container buildTimeItem(ChatUsers chatUsers) {
    return Container(
      padding: EdgeInsets.only(left: width(10)),
      child: Text(
          chatUsers.time,
          maxLines: 1,
          style: GoogleFonts.sarabun(
              fontWeight:
              (chatUsers.isRead == true) ? FontWeight.w600 : FontWeight.w400,
              fontSize: size(14),
              fontStyle: FontStyle.normal,
              color: (chatUsers.isRead == true)
                  ? HexColor("#000000")
                  : HexColor("#828282"))),
    );
  }

  Widget buildLastMessage(ChatUsers chatUsers) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: height(3)),
            child: Text(
                chatUsers.messageText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.sarabun(
                  color: chatUsers.isRead == true ? black : HexColor("#828282"),
                  fontSize: size(14),
                  height: 1.6,
                  fontWeight:
                  chatUsers.isRead == true ? FontWeight.w700 : FontWeight.w400,
                )),
          ),
        ),
        SizedBox(width: width(13)),
        Visibility(
          visible: (chatUsers.newMessageCount ?? 0) > 0,
          child: Container(
            alignment: Alignment.center,
            height: radius(20),
            decoration: BoxDecoration(
                color: red, borderRadius: BorderRadius.circular(35)),
            padding: EdgeInsets.symmetric(
              horizontal: width(7),
            ),
            child: Text(
              chatUsers.newMessageCount.toString(),
              style: GoogleFonts.sarabun(
                  fontWeight: FontWeight.w400,
                  fontSize: size(11),
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }



}