import 'package:do_an/config/config.dart';
import 'package:do_an/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';

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
      body: RefreshIndicator(
        onRefresh: () async  {
          await controller.getProductDetail();
          await controller.getListPostMainCategory();
        },
        child: Column(
          children: [
            Obx(() => controller.isLoading.value ? Expanded(child: loadingLogin(controller.isLoading.value)) : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() => Container(
                        height: 210.h,
                        child:controller.listImage.isNotEmpty ? ImageProductWidget(
                          imageList: controller.listImage,
                          height: 210.h,
                          width: double.infinity,
                          isIndicator: 1,
                          isAutoPlay: true,
                        ) : Container()
                    )),
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
                    buildInfoPost(),
                    Padding(
                      padding: EdgeInsets.only(bottom: height(10)),
                      child: Divider(
                        endIndent: width(20),
                        indent: width(20),
                        thickness: height(1),
                        color: grey_3,
                      ),
                    ),
                    buildSupportChat(),
                    buildListSamePost()
                  ],
                ),
              ),
            )),
            SafeArea(child: buildBottomBar())
          ],
        )
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
              buildItemOptionalAppbar((){Get.toNamed(RouterLink.reportPostPage, arguments: controller.detailPostModel.value.post?.id);},"Báo cáo bài đăng",Icons.report_problem_outlined),
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
     padding: EdgeInsets.only(top: height(10), bottom: height(10), left: width(20), right: width(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    return Obx(() => Container(
      height: height(50),
      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: buildItemStatusDetailPage(controller.detailPostModel.value.post?.liked.toString() ?? "0", Icons.favorite_border, () { }),
          ),
          VerticalDivider(
            endIndent: height(10),
            indent: height(10),
            thickness: height(1),
            color: grey_3,
          ),
          Flexible(
            flex: 1,
            child: buildItemStatusDetailPage((controller.detailPostModel.value.post?.watch ?? 0).toString(), Icons.visibility_outlined, () {
            }),
          ),
          VerticalDivider(
            endIndent: height(10),
            indent: height(10),
            thickness: height(1),
            color: grey_3,
          ),
          Flexible(
            flex: 1,
            child: buildItemStatusDetailPage("Báo cáo", Icons.report_problem_outlined, () {
              Get.toNamed(RouterLink.reportPostPage, arguments: controller.detailPostModel.value.post?.id);
            }),
          ),
        ],
      ),
    ));
  }
  Widget buildItemStatusDetailPage(String tittle, IconData iconData, VoidCallback onClick) {
    return  InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width(10),vertical: height(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: size(20),color: grey_4,),
            SizedBox(width: width(10),),
            Text(tittle, style: AppStyles.textSmallBlackRegular,)
          ],
        ),
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
          Obx(() => Row(
            children: [
              Expanded(
                child: Text(controller.detailPostModel.value.post?.tittle ?? "", style: AppStyles.textNormalBlackMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),

              ),
            ],
          )),
          Obx(() =>  Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height(5)),
                  child: Text(CommonUtil.formatMoney(controller.detailPostModel.value.post?.money ?? 0), style: AppStyles.textSmallRedMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(CommonUtil.parseDateTime(controller.detailPostModel.value.post?.createTime ?? ""), style: AppStyles.textSmallDarkRegular,),),

              Obx(() =>  InkWell(
                onTap: (){
                  if((controller.detailPostModel.value.post?.isLike ?? false)) {
                    controller.unLikePost();
                  }else {
                    controller.likePost();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(8), vertical: height(4)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: height(1), color: (controller.detailPostModel.value.post?.isLike ?? false) ? Colors.white : red),
                    color: (controller.detailPostModel.value.post?.isLike ?? false) ? red.withOpacity(0.7) : Colors.white,
                  ),
                  child: (controller.detailPostModel.value.post?.isLike ?? false) ? Text("Đã lưu tin", style:  AppStyles.textSmallWhiteRegular,) : Text("Lưu tin", style:   AppStyles.textSmallRedRegular,),
                ),
              ))
            ],
          ),
          Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined, size:size(22)),
              SizedBox(width: width(10),),
              Text(controller.detailPostModel.value.userPostData?.address ?? "", style: AppStyles.textSmallDarkRegular,)
            ],
          ))
        ],
      ),
    );
  }
  Widget buildInfoUserPost (){
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: width(60),
              width: width(60),
              child: buildAvatar(controller.detailPostModel.value.userPostData?.avatar ?? Constants.AVATAR_URL, 40)),
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
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text((controller.detailPostModel.value.userPostData?.firstName ?? "") + " " + (controller.detailPostModel.value.userPostData?.lastName ?? ""), style: AppStyles.textSmallBlackMedium,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
                      SizedBox(height:height(12)),
                      RichText(
                        text: TextSpan(
                          text: "Ngày tham gia : ",
                          style: AppStyles.textSmallDarkRegular,
                          children: <TextSpan>[
                            TextSpan(
                              text: controller.dateJoin.value,
                              style: AppStyles.textSmallGreenSemiBold,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: width(8),),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric( vertical: height(4), horizontal: width(6)),
                        child: Center(
                            child:  RichText(
                              text: TextSpan(
                                text: "Tin đăng: ",
                                style: AppStyles.textTinyDarkRegular,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: controller.detailPostModel.value.userPostData?.lengthOfPost.toString() ?? "0",
                                    style: AppStyles.textTinyDarkRegular,
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      SizedBox(height:height(10)),

                      InkWell(
                        onTap: (){
                          Get.toNamed(RouterLink.watchUserPage);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric( vertical: height(4), horizontal: width(6)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: greenMoney)
                          ),
                          child: Center(
                              child:  Text("Xem trang", style: AppStyles.textTinyDarkRegular,)
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
  Widget buildInfoPost(){
    return Obx(()=> Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          RichText(
            text: TextSpan(
              text: "Điều kiện sử dụng : ",
              style:AppStyles.textNormalBlackMedium,
              children: <TextSpan>[
                TextSpan(
                  text: controller.detailPostModel.value.post?.conditionOfUse ?? "",
                  style: AppStyles.textSmallGreenSemiBold,
                ),
              ],
            ),
          ),
          SizedBox(height: height(10),),
          RichText(
            text: TextSpan(
              text: "Hình thức : ",
              style:AppStyles.textNormalBlackMedium,
              children: <TextSpan>[
                TextSpan(
                  text: controller.detailPostModel.value.post?.formUse ?? "",
                  style: AppStyles.textSmallGreenSemiBold,
                ),
              ],
            ),
          ),
          SizedBox(height: height(10),),

          Text("Chi tiết", style: AppStyles.textNormalBlackMedium,),
          SizedBox(height: height(10),),
          Text(controller.detailPostModel.value.post?.content ?? "", maxLines: 20,overflow: TextOverflow.ellipsis,style: AppStyles.textTinyStrongDarkRegular,),
          SizedBox(height: height(10),),
        ],
      ),
    ));
  }
  Widget buildSupportChat(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Hỏi người bán qua chat" , style: AppStyles.textNormalDarkSemiBold,),
          SizedBox(
            height: height(15),
          ),
          Container(
            height: height(50),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildItemSupportChat("Mặt hàng này còn không bạn"),
                buildItemSupportChat("Mặt hàng này còn không bạn"),
                buildItemSupportChat("Mặt hàng này còn không bạn"),
                buildItemSupportChat("Mặt hàng này còn không bạn"),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildItemSupportChat (String tittle){
    return Container(
      margin: EdgeInsets.only(right: width(10)),
      padding: EdgeInsets.symmetric(horizontal: width(12), vertical: height(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: height(1),
          color: greenMoney
        ),

      ),
      child: Center(
        child: Text(tittle, style: AppStyles.textSmallBlackRegular,),
      ),
    );
  }
  Widget buildListSamePost(){
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Tin đăng tương tự", style: AppStyles.textNormalDarkSemiBold,),
          SizedBox(height: height(15),),

          SizedBox(
            height: height(320),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.listPosts.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemProductWidget(post: controller.listPosts[index]);
              },
            ),
          )

        ],
      ),
    ));
  }
}