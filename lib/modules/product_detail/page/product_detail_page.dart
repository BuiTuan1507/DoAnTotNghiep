import 'package:do_an/modules/modules.dart';
import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/theme/app_color.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widget/image_product_widget.dart';

class ProductDetailPage extends GetView<ProductDetailController>{
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Chi tiết tin đăng", style: AppStyles.textNormalWhiteSemiBold),
        backgroundColor: greenMoney,
        actions: [
          InkWell(
            onTap: (){
              modalOptional(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(4)),
              child: Icon(Icons.more_vert, size: size(24),color: Colors.white,),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 210.h,
                child: ImageProductWidget(
                  imageList: controller.imageBanner,
                  height: 210.h,
                  width: double.infinity,
                  isIndicator: 1,
                  isAutoPlay: true,
                )
              ),
            ),
          ),
          SafeArea(child: buildBottomBar())
        ],
      ),

    );
  }


  void modalOptional(BuildContext context) {
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height : height(20)),
              buildItemOptionalAppbar((){Get.back();},"Báo cáo bài đăng",Icons.report_problem_outlined),
              buildItemOptionalAppbar((){Get.back();},"Lưu tin",Icons.post_add_rounded),
              buildItemOptionalAppbar((){Get.back();},"Chia sẻ bài viết",Icons.share),
              SizedBox(height: height(40),)
            ],
          );
          // return your layout
        });
  }

  Widget buildItemOptionalAppbar (VoidCallback onClick, String tittle, IconData iconData){
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: width(15)),
              child: Icon(iconData, size: size(22)),
            ),
            Text(tittle, style: AppStyles.textSmallBlackMedium,)
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar (){
    return Container(
      height: height(80),
     padding: EdgeInsets.only(top: height(10), bottom: height(10), left: width(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
              child: buildItemBottomBar("Gọi điện", Icons.phone_in_talk)
          ),
          VerticalDivider(
            indent: height(10),
            endIndent: height(10),
            thickness: height(1),
            color: grey_4,
          ),
          Flexible(
            flex: 1,
              child: buildItemBottomBar("Nhắn tin", Icons.sms)),
          VerticalDivider(
            indent: height(10),
            endIndent: height(10),
            thickness: height(1),
            color: grey_4,
          ),
          Flexible(
            flex: 1,
              child: buildItemBottomBar("Chat", Icons.message_rounded)),

          Flexible(
            flex: 1,
            child: Container(

              decoration: BoxDecoration(
                  color: greenMoney,
                borderRadius: BorderRadius.circular(3)
              ),
              child: Center(
                child: Text("Mua ngay", style: AppStyles.textSmallWhiteMedium,),
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget buildItemBottomBar(String tittle, IconData iconData){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: size(22),color: greenMoney,),
        SizedBox(height:height(5)),
        Text(tittle, style: AppStyles.textSmallBlackMedium,)
      ],
    );
  }
}