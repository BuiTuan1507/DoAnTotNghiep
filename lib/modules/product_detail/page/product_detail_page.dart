import 'package:do_an/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 210.h,
                    child: ImageProductWidget(
                      imageList: controller.imageBanner,
                      height: 210.h,
                      width: double.infinity,
                      isIndicator: 1,
                      isAutoPlay: true,
                    )
                  ),
                  SizedBox(height: height(10),),
                  buildListStatus(),
                  Padding(
                    padding: EdgeInsets.only(bottom: height(10)),
                    child: Divider(
                      endIndent: width(20),
                      indent: width(20),
                      thickness: height(1),
                      color: grey_3,
                    ),
                  ),
                  buildInfomationPost(),
                  Padding(
                    padding: EdgeInsets.only(bottom: height(10)),
                    child: Divider(
                      endIndent: width(20),
                      indent: width(20),
                      thickness: height(1),
                      color: grey_3,
                    ),
                  ),
                  buildInfoUserPost(),
                  Padding(
                    padding: EdgeInsets.only(bottom: height(10)),
                    child: Divider(
                      endIndent: width(20),
                      indent: width(20),
                      thickness: height(1),
                      color: grey_3,
                    ),
                  ),
                  buildInfoPost()
                ],
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

  Widget buildListStatus (){
    return Container(
      height: height(50),
      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: buildItemStatusDetailPage("0", Icons.favorite_border, () { }),
          ),
          VerticalDivider(
            endIndent: height(10),
            indent: height(10),
            thickness: height(1),
            color: grey_3,
          ),
          Flexible(
            flex: 1,
            child: buildItemStatusDetailPage("Lưu tin", Icons.save, () { }),
          ),
          VerticalDivider(
            endIndent: height(10),
            indent: height(10),
            thickness: height(1),
            color: grey_3,
          ),
          Flexible(
            flex: 1,
            child: buildItemStatusDetailPage("Báo cáo", Icons.report_problem_outlined, () { }),
          ),
        ],
      ),
    );
  }
  Widget buildItemStatusDetailPage(String tittle, IconData iconData, VoidCallback onClick) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: width(10),vertical: height(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: size(20),),
          SizedBox(width: width(10),),
          Text(tittle, style: AppStyles.textSmallBlackRegular,)
        ],
      ),
    );
  }
  Widget buildInfomationPost (){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text("DDaay la ten san pham nay mn i ", style: AppStyles.textNormalBlackMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),

              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height(5)),
                  child: Text("3,4 ty ", style: AppStyles.textSmallRedMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("19/04", style: AppStyles.textSmallDarkRegular,),
              Text("91 lượt xem", style: AppStyles.textSmallDarkRegular,)
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Icon(Icons.location_on_outlined, size:size(22)),
              SizedBox(width: width(10),),
              Text("Số 11, ngõ 21, Văn Quán, Hà Đông, Hà Nội", style: AppStyles.textSmallDarkRegular,)
            ],
          )
        ],
      ),
    );
  }
  Widget buildInfoUserPost (){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width(60),
              width: width(60),
              child: buildAvatar(MyImage.imageBanner, 40)),
          SizedBox(
            width: width(10),
          ),
          Flexible(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Ten use nay,.  nó sẽ dài như thế này  ", style: AppStyles.textSmallBlackMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      SizedBox(height:height(5)),
                      RichText(
                        text: TextSpan(
                          text: "Ngày tham gia : ",
                          style: AppStyles.textSmallDarkRegular,
                          children: <TextSpan>[
                            TextSpan(
                              text: '29/04/2022',
                              style: AppStyles.textSmallGreenSemiBold,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: width(10),),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric( vertical: height(8)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: grey_7.withOpacity(0.4)
                    ),
                    child: Center(
                      child:  RichText(
                        text: TextSpan(
                          text: "Tin đăng : ",
                          style: AppStyles.textTinyDarkRegular,
                          children: <TextSpan>[
                            TextSpan(
                              text: '4',
                              style: AppStyles.textTinyDarkRegular,
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildInfoPost(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Chi tiết", style: AppStyles.textNormalBlackMedium,),
          SizedBox(height: height(15),),
          Text("Day la thong tin chi tiet san pham nay eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", maxLines: 20,overflow: TextOverflow.ellipsis,style: AppStyles.textTinyStrongDarkRegular,),

        ],
      ),
    );
  }
  Widget buildSupportChat(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      child: Column(
        children: [
          Text("Hỏi người bán qua chat" , style: AppStyles.textNormalDarkSemiBold,)
        ],
      ),
    );
  }
}