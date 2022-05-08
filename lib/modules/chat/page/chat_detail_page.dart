
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/chat/chat_users_model.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/cache_image.dart';
import '../../modules.dart';
import '../widget/avatar_widget.dart';
import '../widget/body_chat_page.dart';

class ChatDetailPage extends GetView<ChatDetailController>{
  const ChatDetailPage({Key? key}) : super(key: key);

  void modalSelectedOptional(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              radius(10),
            ),
          ),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height : height(30)),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: height(10)),
                    child: Text("Xoá trò chuyện", style: AppStyles.textSmallBlackRegular,),
                  ),
                ),
                Divider(
                  indent: width(20),
                  endIndent: width(20),
                  height: height(1),
                ),
                Center(
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: height(10)),
                      child: Text("Đóng", style: AppStyles.textSmallBlackRegular,),
                    ),
                  ),
                ),
                SizedBox(height : height(30)),
              ],
            ),
          );
          // return your layout
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarChatDetail(context),
      body: Stack(
        children: <Widget>[

          Column(
            children: [
              buildProductView(),
              BodyChatWidget(),
              Visibility(
                visible: controller.messages.isNotEmpty,
                child: sendModelWithFile(fileModel: controller.fileImage),
              ),

            ],
          ),

          sendMessageField(context)

        ],
      ),
    );
  }

  AppBar appBarChatDetail(BuildContext context){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: width(10)),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(8)),
                child: SvgPicture.asset(MyIcon.callPhoneIcon),
              ),
              Container(
                height:height(30),
                width: height(30),
                margin: EdgeInsets.symmetric(horizontal: width(8)),
                child: Image.asset(MyIcon.smsIcon, fit: BoxFit.cover,),
              ),
              InkWell(
                onTap: (){
                  modalSelectedOptional(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(8)),
                  child: Icon(Icons.more_horiz, size: size(22),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sendMessageField(BuildContext context){
   return  Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.all(height(10)),
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(height(5)),
                height: height(30),
                width: height(30),
                child: SvgPicture.asset(MyIcon.cameraIcon, fit: BoxFit.cover,color: greenMoney,),
              ),
            ),
            SizedBox(
              width: width(10),
            ),
            Expanded(
              child: TextField(
                controller: controller.textEditingController,
                maxLines: 5,
                minLines: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    hintText: 'Nhập tin nhắn ',
                    isDense: true,
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: height(24), maxWidth: width(24)),
                    contentPadding: EdgeInsets.zero,
                    hintStyle: GoogleFonts.sarabun(
                        fontSize: 14, color: grey_3),
                    disabledBorder: InputBorder.none,
                  )
              ),
            ),
            SizedBox(
              width: width(10),
            ),
            InkWell(
              onTap: () async {
                String message = controller.textEditingController.text.trim();
                ChatMessage chatMessage = ChatMessage(messageContent: message, messageType: "sender", sendMessageStatus: true);
                controller.messages.add(chatMessage);

                controller.textEditingController.clear();

                FocusScope.of(context).unfocus();

                await Future.delayed(const Duration(seconds: 2), (){
                  controller.messages.remove(chatMessage);
                  chatMessage.sendMessageStatus = false;
                  controller.messages.add(chatMessage);
                });
              } ,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width(10)),
                child: SvgPicture.asset(MyIcon.sendMessageIcon),
              ),
            )
          ],
        ),
      ),
    );  }




  Widget buildProductView(){
    return Container(
      height: height(70),
      //width: double.infinity,
      color: HexColor("F5F5F5"),
      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height(50),
            width: height(50),
            child: CacheImage(
              imageUrl: MyImage.imageBanner,
              boxFit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: width(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Tên sản phẩm này, ..............", style: AppStyles.textSmallBlackRegular,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  SizedBox(
                    height: height(10),
                  ),
                  Expanded(child: Text("3,2 tỷ", style: AppStyles.textSmallRedMedium,))
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
              child: SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC")))
        ],
      ),
    );
  }


  Widget sendModelWithFile({required List<File> fileModel}) {
    return Container(
      height: height(60),
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: width(5)),
      alignment: Alignment.centerLeft,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: fileModel.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(5.0),
          width: height(60),
          height: height(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius(5)),
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                color: blue,
                child: CachedNetworkImage(
                  imageUrl: "",
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    //   _controller.deleteItemModelImage(index);
                  },
                  child: Container(
                    color: black,
                    height: height(15),
                    width: height(15),
                    child: SvgPicture.asset(
                      MyIcon.closeIcon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

}