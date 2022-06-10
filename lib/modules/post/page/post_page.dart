import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/modules/post/controller/post_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/user/post_user_model.dart';
import '../../../utils/utils.dart';

class PostPage extends GetView<PostController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quản lí tin đăng",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        backgroundColor: greenMoney,
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width(10)),
                    child: TabBar(
                      onTap: (int index) {
                        controller.currentIndex.value = index;
                      },
                      isScrollable: true,
                      indicatorColor: amber,
                      indicatorWeight: 2,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: width(2), color: amber),
                          insets: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h)),
                      labelColor: amber,
                      unselectedLabelColor: lightDarkHintText.withOpacity(0.74),
                      tabs:  [
                        Obx(() => Tab(
                          text: 'Đang hiển thị ('+ controller.activeListPost.length.toString()+")" ,
                        )),
                        Obx(() => Tab(
                          text: 'Chờ duyệt ('+ controller.inExtendListPost.length.toString()+")",
                        )),
                        Obx(() => Tab(
                          text: 'Cần gia hạn ('+ controller.extendListPost.length.toString()+")",
                        )),
                        Obx(() => Tab(
                          text: 'Tin bị huỷ ('+ controller.cancelListPost.length.toString()+")",
                        )),
                        Obx(() => Tab(
                          text: 'Đã bán ('+ controller.sellListPost.length.toString()+")",
                        ))
                      ],
                    ),
                  )),
            ];
          },
          body: TabBarView(
            children: [

              Obx(() =>  buildTabView(controller.activeListPost , context, 1),),

              Obx(() => buildTabView(controller.inExtendListPost, context, 1),),

              Obx(() => buildTabView(controller.extendListPost, context, 2),),

              Obx(() => buildTabView(controller.cancelListPost, context , 3),),

              Obx(() => buildTabView(controller.sellListPost, context , 4),)

            ],
          ),
        ),
      )
    );
  }
  Widget buildTabView(List<Posts> posts, BuildContext context, int state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(child: buildListPost( posts, context,  state))
      ],
    );
  }
  Widget buildListPost(List<Posts> posts, BuildContext context, int state){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
          child: posts.isNotEmpty ? ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context , index) {
              if(state == 1) {
                return Padding(padding: EdgeInsets.symmetric(vertical: height(7)),
                    child: buildItemPost(posts[index] , context));
              }else if (state == 2){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height(7)),
                  child: buildItemPostExtend(posts[index] , context),
                );
              } else if( state == 3) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height(7)),
                  child: buildItemPostCancel(posts[index] , context),
                );
              }
              else if( state == 4) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height(7)),
                  child: buildItemPostSell(posts[index] , context),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(vertical: height(7)),
                child: buildItemPost(posts[index] , context),
              );
            },
          ) :  Center(
            child: Text("Không có bài đăng nào"),
          ),
        ),
        Obx(() => loadingLogin( controller.isLoading.value))
      ],
    );
  }
  Widget buildItemPost(Posts post, BuildContext context){
    String image = post.media?.first.fileDownloadUri ?? "";
    if(image == ""){
      image = Constants.PRODUCT_URL;
    }
    String dateTime = post.editTime ?? "";
   DateTime time =   DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(dateTime);
   DateTime newTime = DateTime(time.year, time.month + 1, time.day);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: width(60),
              width: width(60),
              child: buildAvatarProduct(imageUrl: image)),
          SizedBox(
            width: width(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(post.tittle ?? "" ,style: AppStyles.textNormalBlackMedium,),
                SizedBox(height: height(5),),
                RichText(
                  text: TextSpan(
                    text: "Thời hạn : ",
                    style: AppStyles.textSmallDarkRegular,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat("dd-MM-yyyy").format(newTime),
                        style: AppStyles.textSmallGreenSemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              MyDialog.popUpAsk(context, tittle: "Thông báo ", hintText: "Bạn có muốn huỷ bài đăng ?", onSubmit: () {
                controller.cancelPost(post.id ?? 0, post.state ?? 0, context);
              }, onCancel: () {
                Get.back();
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(4)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: height(1), color: greenMoney)
              ),
              child: Text("Huỷ", style: AppStyles.textSmallBlackMedium,),
            ),
          )
        ],
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
              borderRadius: BorderRadius.circular(15)
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
              borderRadius: BorderRadius.circular(15)
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
          borderRadius: BorderRadius.circular(15)
      ),
    );
  }

  Widget buildItemPostExtend(Posts post, BuildContext context){
    String image = post.media?.first.fileDownloadUri ?? "";
    if(image == ""){
      image = Constants.PRODUCT_URL;
    }
    String dateTime = post.editTime ?? "";
    DateTime time =   DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(dateTime);
    DateTime newTime = DateTime(time.year, time.month , time.day);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: width(60),
              width: width(60),
              child: buildAvatarProduct(imageUrl: image)),
          SizedBox(
            width: width(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(post.tittle ?? "" ,style: AppStyles.textNormalBlackMedium,),
                SizedBox(height: height(5),),
                RichText(
                  text: TextSpan(
                    text: "Hết hạn lúc:",
                    style: AppStyles.textSmallDarkRegular,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat("dd-MM-yyyy").format(newTime),
                        style: AppStyles.textSmallGreenSemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: (){
                  MyDialog.popUpAsk(context, tittle: "Thông báo", hintText: "Bạn có muốn gia hạn bài đăng (tốn 100 điểm) ? ", onSubmit: () {
                    controller.extendPost(post.id ?? 0, context);
                  }, onCancel: () {
                    Get.back();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(4)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: height(1), color: greenMoney)
                  ),
                  child: Text("Gia hạn", style: AppStyles.textSmallBlackMedium,),
                ),
              ),
              SizedBox(height: height(5),),
              InkWell(
                onTap: (){
                  MyDialog.popUpAsk(context, tittle: "Thông báo", hintText: "Bạn có muốn huỷ bài đăng ?", onSubmit: () {
                    controller.cancelPost(post.id ?? 0, post.state ?? 0, context);
                  }, onCancel: () {
                    Get.back();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(4)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: height(1), color: greenMoney)
                  ),
                  child: Text("Huỷ", style: AppStyles.textSmallBlackMedium,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildItemPostCancel(Posts post, BuildContext context){
    String image = post.media?.first.fileDownloadUri ?? "";
    if(image == ""){
      image = Constants.PRODUCT_URL;
    }
    String dateTime = post.createTime ?? "";
    DateTime time =   DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(dateTime);
    DateTime newTime = DateTime(time.year, time.month + 1, time.day);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: width(60),
              width: width(60),
              child: buildAvatarProduct(imageUrl: image)),
          SizedBox(
            width: width(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(post.tittle ?? "" ,style: AppStyles.textNormalBlackMedium,),
                SizedBox(height: height(5),),
                RichText(
                  text: TextSpan(
                    text: "Ngày đăng :",
                    style: AppStyles.textSmallDarkRegular,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat("dd-MM-yyyy").format(newTime),
                        style: AppStyles.textSmallGreenSemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemPostSell(Posts post, BuildContext context){
    String image = post.media?.first.fileDownloadUri ?? "";
    if(image == ""){
      image = Constants.PRODUCT_URL;
    }
    String dateTime = post.editTime ?? "";
    DateTime time =   DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(dateTime);
    DateTime newTime = DateTime(time.year, time.month + 1, time.day);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: width(60),
              width: width(60),
              child: buildAvatarProduct(imageUrl: image)),
          SizedBox(
            width: width(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(post.tittle ?? "" ,style: AppStyles.textNormalBlackMedium,),
                SizedBox(height: height(5),),
                RichText(
                  text: TextSpan(
                    text: "Đã bán vào :",
                    style: AppStyles.textSmallDarkRegular,
                    children: <TextSpan>[
                      TextSpan(
                        text: DateFormat("dd-MM-yyyy").format(newTime),
                        style: AppStyles.textSmallGreenSemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}