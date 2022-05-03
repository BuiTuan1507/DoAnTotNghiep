import 'package:do_an/models/category/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width(10), vertical: height(20)),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // controller: scrollController,
                itemCount: controller.categoryModel.value.categoryLv2?.length ?? 1,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return buildItemCategory(context, controller.categoryModel.value.categoryLv2?[index] ?? CategoryLv2() );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    indent: width(12),
                    endIndent: width(12),
                    height: height(1),
                  );
                },
              ),
            )
          ]),
    );
  }

  Widget buildItemCategory(BuildContext context,CategoryLv2 categoryLv2) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      color: (categoryLv2.isSelected ?? false) ? greenMoney.withOpacity(0.5) : Colors.transparent,
      child: InkWell(
        onTap: (){
      //    Get.toNamed(RouterLink.addPostCategoryPage, arguments: categoryModel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryLv2.name ?? " ",
              style: AppStyles.textSmallBlackRegular,
            ),
            SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC"))
          ],
        ),
      ),
    );
  }
}
