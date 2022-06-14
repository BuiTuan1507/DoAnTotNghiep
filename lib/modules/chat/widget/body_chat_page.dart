
import 'package:do_an/models/chat/chat_users_model.dart';
import 'package:do_an/models/chat/message_model.dart';
import 'package:do_an/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../service/share_prefencers/global_data.dart';
import '../../../utils/utils.dart';
import 'avatar_widget.dart';

class BodyChatWidget extends StatefulWidget {
  const BodyChatWidget({Key? key}) : super(key: key);

  @override
  State<BodyChatWidget> createState() => _BodyChatWidgetState();
}

class _BodyChatWidgetState extends State<BodyChatWidget> {
  ChatDetailController controller = Get.find();
  int userId = GlobalData.getUserModel().id ?? 0;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Obx(()=> ListView(
        controller: controller.scrollController,
        reverse: true,
        shrinkWrap: true,
        physics:
        const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

        children: List.generate(controller.listMessage.length, (index) =>
            buildTextMessage(controller.listMessage[index], userId)
        ),
      )),
    );
  }
  Widget buildTextMessage(MessageModel messageModel, int userId){
    Widget widgetLeft;
    Widget widgetRight;


    widgetLeft =  messageModel.idUser == userId ? buildAvatarUser(imageUrl: '', size: 20) : chatContent(messageModel);
    widgetRight =  messageModel.idUser != userId ? buildAvatarUser(imageUrl: '', size: 20) : chatContent(messageModel);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(8), vertical: height(6)),
      child: Align(
        alignment: (messageModel.idUser == userId? Alignment.topLeft:Alignment.topRight),
        child: Column(
          crossAxisAlignment:messageModel.idUser == userId ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          mainAxisAlignment:   MainAxisAlignment.start ,
          children: [
            Visibility(
              visible: true,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height(10)),
                child: Text(
                  "19:31",
                  style: GoogleFonts.sarabun(
                    color: greySubText,
                    fontSize: size(12),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: messageModel.idUser == userId ? MainAxisAlignment.start : MainAxisAlignment.end,

              children: [
                widgetLeft,
                SizedBox(width: width(10),),
                widgetRight
              ],
            ),
            sendMessageState(messageModel),
            Visibility(
              visible: messageModel.sendMessageStatus ?? false,
                child: errorMessageState(messageModel)
            )
          ],
        ),
      ),
    );
  }
  Widget chatContent (MessageModel messageModel){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ( messageModel.idUser == userId ? Colors.grey.shade200 : Colors.blue[200]),
      ),
      padding: EdgeInsets.all(width(8)),
      child: Text( messageModel.message ?? "", style: AppStyles.textSmallBlackRegular),
    );
  }

  Widget sendMessageState(
      MessageModel messageModel) {
    if((messageModel.sendMessageStatus ?? true) && messageModel.idUser == userId) {
      return Container(
        margin: EdgeInsets.only(
          right: width(7),
          top: height(5),
          bottom: height(10),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(MyImage.wallClock),
            SizedBox(width: width(5)),
            Flexible(
              child: Text(
                "Đang gửi...",
                style: GoogleFonts.sarabun(
                    fontWeight: FontWeight.w400,
                    fontSize: size(10),
                    color: grey_4),
              ),
            ),
          ],
        ),
      );
    }else {
      return Container();
    }
  }

  Widget errorMessageState(
      MessageModel mess) {
    String textError = "Gửi không thành công. Nhấn để gửi lại!";
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        /*
            if (mess.contentType == Const.IMAGE)
              _controller.resentMediaMessage(
                  context: context,
                  indexMessage: indexMessage,
                  mess: mess,
                  isPhoto: true);
            else if (mess.contentType == Const.VIDEO)
              _controller.resentMediaMessage(
                  context: context,
                  indexMessage: indexMessage,
                  mess: mess,
                  isPhoto: false);
            else if (mess.contentType == Const.TEXT)
              _controller.resentTextMessage(
                  mess: mess, indexMessage: indexMessage);

             */
      },
      child: Container(
        margin: EdgeInsets.only(
          right:  width(7),
          top: height(6),
          bottom: height(10),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(MyImage.warning),
            SizedBox(width: width(5)),
            Text(
              textError,
              style: GoogleFonts.sarabun(
                fontWeight: FontWeight.w400,
                fontSize: size(10),
                color: red,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
