import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/modules/account/controller/purchase_order_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/post/post_user_data_model.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/cache_image.dart';

class PurchaseOrderPage extends GetView<PurchaseOrderController>{
  const PurchaseOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          "Đơn đã mua",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: Obx(()=> buildTabView(controller.listPostUserData)),
    );
  }

  Widget buildTabView(List<PostUserDataModel> listPostBuy) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Obx(()=> loadingLogin(controller.isLoading.value),),
        Expanded(child: buildListPost(listPostBuy))
      ],
    );
  }
  Widget buildListPost(List<PostUserDataModel> listPostBuy){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: listPostBuy.isEmpty,
            child: Container(
              child: Center(
                child: Text("Danh sách tin mua trống", style: AppStyles.textNormalBlackMedium,),
              ),
            ),
          ),
          Visibility(
            visible: listPostBuy.isNotEmpty,
            child: Column(
              children: List.generate(listPostBuy.length , (index) {
                return buildItemFriends(listPostBuy[index]);
              }),
            ),
          )
        ],
      ),
    );
  }
  Widget buildItemFriends (PostUserDataModel post){
    String rating = "0.0";
    if(post.rating == 0.0){
      rating = "Chưa có";
    }else{
      rating = post.rating.toString();
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: width(20)) ,
                  height: width(50),
                  width: width(50),
                  child: CacheImage(imageUrl: post.avatarUser ?? ""),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height(10)),
                      child: Expanded(child: Text(post.nameUser ?? "", style: AppStyles.textSmallBlackRegular,)),
                    ),
                  ],
                )
              ],
            ),
          ),

          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height(5)),
                  child: Text("Ngày mua : " + CommonUtil.parseDateTime(post.editTime ?? ""), style: AppStyles.textSmallBlackRegular,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height(5)),
                  child: Row(
                    children: [
                      Text("Đánh giá : " + rating, style: AppStyles.textSmallBlackRegular,),
                      Padding(
                        padding: EdgeInsets.only(left: width(5)),
                        child: Icon(Icons.star, color: amber,size: size(16),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: width(20)) ,
                  height: width(60),
                  width: width(60),
                  child: buildAvatarProduct(imageUrl: post.imagePost ?? ""),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height(10)),
                  child: Text(post.tittle ?? "", style: AppStyles.textSmallBlackRegular,),
                )
              ],
            ),
          ),

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

}