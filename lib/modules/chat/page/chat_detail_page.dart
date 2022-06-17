
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  child: InkWell(
                    onTap: (){
                      controller.deleteChatRoom();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: height(10)),
                      child: Text("Xoá trò chuyện", style: AppStyles.textSmallBlackRegular,),
                    ),
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

              const BodyChatWidget(),
              Obx(() => Visibility(
                  visible: controller.isLoading.value,
                  child: Padding(padding: EdgeInsets.only(bottom: height(10)),child: loadingLogin(controller.isLoading.value),))),

              sendMessageField(context)
            ],
          ),


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
        child: Obx(() => Container(
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
              buildAvatarUser(imageUrl: controller.detailChatRoomModel.value.infoUserChat?.avatar ?? "", size: 40),
              SizedBox(
                width: width(12),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      controller.detailChatRoomModel.value.infoUserChat?.name ?? "",
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
              InkWell(
                onTap: (){
                  String phoneNumber = controller.detailChatRoomModel.value.infoUserChat?.phoneNumber ?? "";
                  launch("tel://$phoneNumber");
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(8)),
                  child: SvgPicture.asset(MyIcon.callPhoneIcon),
                ),
              ),
              InkWell(
                onTap: (){
                  String phoneNumber = controller.detailChatRoomModel.value.infoUserChat?.phoneNumber ?? "";
                  launch("sms://$phoneNumber");
                },
                child: Container(
                  height:height(30),
                  width: height(30),
                  margin: EdgeInsets.symmetric(horizontal: width(8)),
                  child: Image.asset(MyIcon.smsIcon, fit: BoxFit.cover,),
                ),
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
        )),
      ),
    );
  }

  Widget sendMessageField(BuildContext context){
   return  Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisSize: MainAxisSize.max,
     mainAxisAlignment: MainAxisAlignment.end,
     children: [
       Obx(()=> Visibility(
         visible: (controller.file?.length ?? 0) > 0,
         child: SizedBox(
           height: height(100),
           child: ListView.builder(
             physics: BouncingScrollPhysics(),
             shrinkWrap: true,
             scrollDirection: Axis.horizontal,
             itemCount: controller.file?.length ?? 0,
             itemBuilder: (context ,  index) => Container(
               constraints: BoxConstraints(
                   maxHeight: height(100), maxWidth: width(100)),
               child: Stack(
                   children: [
                     (controller.file?.length ?? 0) > 0
                         ?
                     Container(
                       margin: EdgeInsets.only(right: width(10)),
                       width: width(100),
                       height: height(100),
                       child: controller.file?[index].type == "image" ? ClipRRect(
                         child: Image.file(
                           controller.file?[index].file ?? File(''),
                           fit: BoxFit.cover,
                         ),
                       ) : Center(
                           child: Text(
                             'Video',
                             style: TextStyle(color: greenMoney),
                           )),
                     )
                         : Container(),
                     Align(
                       alignment: Alignment.topRight,
                       child: IconButton(
                         onPressed: () {
                           controller.file?[index].file = File('');
                           controller.file?.removeAt(index);

                           if(CommonUtil.isEmpty(controller.textEditingController.text) && (controller.file?.length ?? 0) == 0) {
                             controller.isShowSendButton.value = false;
                           }
                         },
                         icon: const Icon(Icons.cancel),
                       ),
                     )
                   ]),
             ),
           ),

         ),
       ),),

       Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.all(height(10)),
            height: 50,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    controller.openImage(true);
                  },
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
                GestureDetector(
                  onTap: () {
                    controller.openImage(false);
                  },
                  child: Container(
                    margin: EdgeInsets.all(height(5)),
                    height: height(30),
                    width: height(30),
                    child: SvgPicture.asset(MyIcon.videoIcon, fit: BoxFit.cover,color: greenMoney,),
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
                      onChanged: (value){
                      controller.checkButton();
                      },
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
                   if(controller.textEditingController.text != ""){
                     controller.sendTestMessage(context);
                   }
                   if((controller.file?.length ?? 0) > 0){
                     controller.sendMediaMessage(context);
                   }
                  } ,
                  child: Obx(() => Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(10)),
                    child: SvgPicture.asset(MyIcon.sendMessageIcon, color: controller.isShowSendButton.value ? greenMoney : grey_3,),
                  )),
                )
              ],
            ),
          ),
        ),
     ],
   );  }




  Widget buildProductView(){
    return Obx(() => InkWell(
      onTap: (){
        Get.toNamed(RouterLink.productDetailPage, arguments: controller.detailChatRoomModel.value.infoPostChat?.id ?? 0);
      },
      child: Container(
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
                imageUrl: controller.detailChatRoomModel.value.infoPostChat?.image ?? "",
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
                      child: Text(controller.detailChatRoomModel.value.infoPostChat?.tittle ?? "", style: AppStyles.textSmallBlackRegular,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    ),
                    SizedBox(
                      height: height(10),
                    ),
                    Expanded(child: Text(CommonUtil.formatMoney(controller.detailChatRoomModel.value.infoPostChat?.money ?? 0,), style: AppStyles.textSmallRedMedium,))
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC")))
          ],
        ),
      ),
    ));
  }






}