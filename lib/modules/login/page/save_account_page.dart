import 'package:do_an/modules/chat/widget/avatar_widget.dart';
import 'package:do_an/modules/login/controller/save_account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user/user_model.dart';
import '../../../utils/utils.dart';

class SaveAccountPage extends GetView<SaveAccountController>{
  const SaveAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lưu tài khoản",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: ListView(
        children: [
          buildText(),

        ],
      ),
    );
  }
  Widget buildText(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
      child: Text("Nhấp vào ảnh đại diện để đăng nhập", style: AppStyles.textNormalBlackRegular,),
    );
  }

  Widget buildListUser(){
    return Container(
      child: Column(
        children: List.generate(
            controller.listUser.length,
                (index) =>
                    buildItemUser(controller.listUser[index])),
      ),
    );
  }


  Widget buildItemUser(UserModel userModel){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      child: Row(
        children: [
          buildAvatarUser(imageUrl: userModel.avatar ?? "", size: 30),
          SizedBox(height: width(10),),
          Expanded(
            child: Text( (userModel.firstName ?? "") + (userModel.lastName ?? ""), style: AppStyles.textNormalBlackRegular,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(0)),
            child: Icon(Icons.more_vert, size: size(20),),
          )
        ],
      ),
    );
  }
  
}