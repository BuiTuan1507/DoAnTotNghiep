import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../models/post/post_user_data_model.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/cache_image.dart';
import '../controller/sell_order_controller.dart';

class SellOrderPage extends GetView<SellOrderController>{
  const SellOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          "Đơn đã bán",
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
                child: Text("Danh sách tin bán trống", style: AppStyles.textNormalBlackMedium,),
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
    var  data = {
      "idPost" : post.id,
      "status" : 1
    };
    return InkWell(
      onTap: (){
        Get.toNamed(RouterLink.productDetailPage, arguments: data);
      },
      child: Container(
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
                    child: buildAvatarProduct(imageUrl: post.avatarUser ?? "", borderRadius: 25, urlDefault: Constants.AVATAR_URL),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height(10)),
                        child: Text(post.nameUser ?? "", style: AppStyles.textSmallBlackRegular,overflow: TextOverflow.ellipsis,),
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
                    child: buildAvatarProduct(imageUrl: post.imagePost ?? "", borderRadius: 5, urlDefault: Constants.PRODUCT_URL),
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
      ),
    );
  }

  Widget buildAvatarProduct({required String imageUrl,required double borderRadius, required String urlDefault}){
    return (imageUrl != "")
        ? CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, image) {
        return Container(
          height: width(60),
          width: width(40),
          decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(borderRadius)
          ),
        );
      },
      placeholder: (context, image) {
        return Container(
          height: width(60),
          width: width(40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(urlDefault),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(borderRadius)
          ),
        );
      },
    )
        : Container(
      height: width(60),
      width: width(40),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(urlDefault),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(borderRadius)
      ),
    );
  }

}