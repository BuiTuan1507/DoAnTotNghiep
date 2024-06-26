import 'package:do_an/models/category/category_model.dart';
import 'package:do_an/modules/list_category/controller/list_category_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../models/user/post_user_model.dart';
import '../../../utils/utils.dart';
import '../../../utils/widget/cache_image.dart';

class ListCategoryPostPage extends GetView<ListCategoryPostController> {
  const ListCategoryPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.nameCategory,
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        backgroundColor: greenMoney,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          buildSelectCategory(context),
          Obx(
            () => Visibility(
              visible: controller.listPosts.isEmpty &&
                  controller.isLoading.value == false,
              child: Container(
                padding: EdgeInsets.only(top: height(50)),
                child: Center(
                  child: Text(
                    "Không tìm thấy bài đăng nào",
                    style: AppStyles.textSmallBlackRegular,
                  ),
                ),
              ),
            ),
          ),
          Obx(() => buildListPostFilter(listPost: controller.listPosts)),
          Obx(() => loadingLogin(controller.isLoading.value))
        ],
      ),
    );
  }

  Widget buildSelectCategory(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouterLink.addPostCategoryPage, arguments: {
          "mainCategory": MainCategory(),
          "idMainCategory": controller.idMainCategory,
          "state": 1
        })?.then((value) async {
          if (value != null) {
            controller.page = 0;

            controller.selectedCategory.value = value;
            controller.selectedMainCategoryName.value =
                controller.selectedCategory.value.sName ?? "";

            await controller.getListPostSubCategory();
          }
        });
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(6)),
        height: height(60),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: height(1), color: grey_5),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Danh mục phụ",
              style: AppStyles.textSmallBlackMedium,
            ),
            Padding(
              padding: EdgeInsets.only(right: width(10)),
            ),
            Obx(() => Text(
                  controller.selectedMainCategoryName.value,
                  style: AppStyles.textSmallBlackMedium,
                )),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_drop_down,
                  size: size(22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListPostFilter({required List<Posts> listPost}) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(10), vertical: height(10)),
      child: Column(
        children: List.generate(listPost.length,
            (index) => buildItemPostFilter(index, listPost[index])),
      ),
    );
  }

  Widget buildItemPostFilter(int index, Posts posts) {
    String image = MyImage.imageBanner;
    if (posts.media?.isNotEmpty == true) {
      image = posts.media?.first.fileDownloadUri ?? MyImage.imageBanner;
    }
     var  data = {
      "idPost" : posts.id,
      "status" : 0
   };
    return InkWell(
      onTap: (){
        Get.toNamed(RouterLink.productDetailPage, arguments: data);
      },
      child: Container(
        height: height(125),
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(00)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: width(60),
              width: width(80),
              child: CacheImage(
                imageUrl: image,
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
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            posts.content ?? '',
                            style: AppStyles.textNormalBlackMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          CommonUtil.formatMoney(posts.money ?? 0),
                          style: AppStyles.textSmallRedMedium,
                        ),
                        Text(
                          CommonUtil.parseDateTime(posts.createTime ?? ""),
                          style: AppStyles.textSmallDarkNormal,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
