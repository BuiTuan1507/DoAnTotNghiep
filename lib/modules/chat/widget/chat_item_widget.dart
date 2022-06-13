import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/models/chat/chat_room_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/config.dart';
import '../../../models/chat/chat_users_model.dart';
import '../../../utils/common/screen_utils.dart';
import '../../../utils/utils.dart';
import '../page/chat_detail_page.dart';
import 'avatar_widget.dart';



class ChatItemWidget extends StatefulWidget{
  final ChatRoomModel chatUser;
   ChatItemWidget({required this.chatUser});
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
        padding: EdgeInsets.symmetric(horizontal: width(12), vertical: height(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: buildAvatarUser(imageUrl: '', size: 60)),
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
            buildAvatarProduct(imageUrl: widget.chatUser.avatarPost ?? "")
          ],
        ),
      ),
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


  Widget buildNameItem(ChatRoomModel chatRoomModel) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            chatRoomModel.nameCustomer ?? "",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sarabun(
                fontWeight: FontWeight.w600,
                fontSize: size(16),
                fontStyle: FontStyle.normal),
            maxLines: 1,
            softWrap: true,
          ),
        ),
        buildTimeItem(chatRoomModel)
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

  Container buildTimeItem(ChatRoomModel chatRoomModel) {
    return Container(
      padding: EdgeInsets.only(left: width(10)),
      child: Text(
          CommonUtil.parseDateTime(chatRoomModel.createTime ?? ""),
          maxLines: 1,
          style: GoogleFonts.sarabun(
              fontWeight:
              ((chatRoomModel.lastMessage?.isReading ?? false) == true) ? FontWeight.w600 : FontWeight.w400,
              fontSize: size(14),
              fontStyle: FontStyle.normal,
              color: ((chatRoomModel.lastMessage?.isReading ?? false) == true)
                  ? HexColor("#000000")
                  : HexColor("#828282"))),
    );
  }

  Widget buildLastMessage(ChatRoomModel chatRoomModel) {
    String message = "";
    switch(chatRoomModel.lastMessage?.type) {
      case "text": {
        message = chatRoomModel.lastMessage?.message ?? "";
      }
      break;

      case "image": {
        message = "Hình ảnh";
      }
      break;
      case "video": {
        message = "Video";
      }
      break;

      default: {

      }
      break;
    }
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: height(3)),
            child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.sarabun(
                  color: (chatRoomModel.lastMessage?.isReading ?? false) == true ? black : HexColor("#828282"),
                  fontSize: size(14),
                  height: 1.6,
                  fontWeight:
                  (chatRoomModel.lastMessage?.isReading ?? false) == true ? FontWeight.w700 : FontWeight.w400,
                )),
          ),
        ),
        SizedBox(width: width(13)),
        Visibility(
          visible: (chatRoomModel.countReadMessage ?? 0) > 0,
          child: Container(
            alignment: Alignment.center,
            height: radius(20),
            decoration: BoxDecoration(
                color: red, borderRadius: BorderRadius.circular(35)),
            padding: EdgeInsets.symmetric(
              horizontal: width(7),
            ),
            child: Text(
              chatRoomModel.countReadMessage.toString(),
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