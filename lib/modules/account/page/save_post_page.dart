import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/modules/account/controller/save_post_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../models/post/post_user_like_model.dart';

import '../../../utils/utils.dart';

class SavePostPage extends GetView<SavePostController> {
  const SavePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lưu tin",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: Obx(() => buildTabView(controller.listPostUserData)),
    );
  }

  Widget buildTabView(List<PostUserLikeModel> listPostBuy) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => loadingLogin(controller.isLoading.value),
        ),
        Expanded(child: buildListPost(listPostBuy))
      ],
    );
  }

  Widget buildListPost(List<PostUserLikeModel> listPostBuy) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: listPostBuy.isEmpty,
            child: Container(
              child: Center(
                child: Text(
                  "Danh sách lưu tin trống",
                  style: AppStyles.textNormalBlackMedium,
                ),
              ),
            ),
          ),
          Visibility(
            visible: listPostBuy.isNotEmpty,
            child: Column(
              children: List.generate(listPostBuy.length, (index) {
                return buildItemFriends(listPostBuy[index]);
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemFriends(PostUserLikeModel post) {
    var  data = {
      "idPost" : post.id,
      "status" : 0
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
            Container(
              margin: EdgeInsets.only(right: width(20)),
              height: width(60),
              width: width(60),
              child: buildAvatarProduct(imageUrl: post.imagePost ?? ""),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: height(10)),
              child: Text(
                post.tittle ?? "",
                style: AppStyles.textSmallBlackRegular,
              ),
            )),
            Padding(
                padding: EdgeInsets.only(right: width(15)),
                child: InkWell(
                  onTap: () {
                    if (post.isLike == true) {
                      controller.unLikePost(post);
                    } else {
                      controller.likePost(post);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height(4), horizontal: width(6)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: post.isLike == true
                                ? greenMoney
                                : red.withOpacity(0.7))),
                    child: Center(
                        child: post.isLike == true
                            ? Text(
                                "Bỏ lưu tin",
                                style: AppStyles.textTinyDarkRegular,
                              )
                            : Text(
                                " Lưu tin",
                                style: AppStyles.textTinyRedMedium,
                              )),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildAvatarProduct({required String imageUrl}) {
    return (imageUrl != "")
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, image) {
              return Container(
                height: width(60),
                width: width(40),
                decoration: BoxDecoration(
                    image: DecorationImage(image: image, fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)),
              );
            },
            placeholder: (context, image) {
              return Container(
                height: width(60),
                width: width(40),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(Constants.PRODUCT_URL),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)),
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
                borderRadius: BorderRadius.circular(5)),
          );
  }
}
