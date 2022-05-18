import 'package:do_an/models/category/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';

class AddPostCategoryPage extends GetView<AddPostCategoryController> {
  const AddPostCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Danh mục phụ",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        backgroundColor: greenMoney
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height(10),
            ),
            Obx(() => Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width(10), vertical: height(20)),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // controller: scrollController,
                itemCount: controller.listSubCategory.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return buildItemCategorylv2(context, controller.listSubCategory[index] );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    indent: width(12),
                    endIndent: width(12),
                    height: height(1),
                  );
                },
              ),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: height(50)),
                child: Obx(() => loadingLogin(controller.isLoading.value)),
              ),
            )
          ]),
    );
  }

  Widget buildItemCategorylv2(BuildContext context,SubCategory subCategory) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      color: (subCategory.isSelected ?? false) ? greenMoney.withOpacity(0.5) : Colors.transparent,
      child: InkWell(
        onTap: (){
          Get.toNamed(RouterLink.addPostInfoPage, arguments: {
            "mainCategory": controller.mainCategory.value,
            "subCategory":subCategory
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subCategory.sName ?? " ",
              style: AppStyles.textSmallBlackRegular,
            ),
            SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC"))
          ],
        ),
      ),
    );
  }
}
