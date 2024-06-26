import 'package:do_an/config/config.dart';
import 'package:do_an/models/category/category_model.dart';
import 'package:do_an/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../modules.dart';

class AddPostPage extends GetView<AddPostController> {

  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Danh mục chính",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        backgroundColor: greenMoney,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height(10),
              ),
              Obx(() => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width(10), vertical: height(10)),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // controller: scrollController,
                  itemCount: controller.listMainCategory.length,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    return buildItemCategory(context, controller.listMainCategory[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      indent: width(12),
                      endIndent: width(12),
                      height: height(1),
                    );
                  },
                ),
              ),

              ),
              Obx(() => loadingLogin(controller.isLoading.value))
            ]),
      ),
    );
  }

  Widget buildItemCategory(BuildContext context,MainCategory mainCategory) {
    return InkWell(
      onTap: (){
        Get.toNamed(RouterLink.addPostCategoryPage, arguments: {
          "mainCategory": mainCategory,
          "idMainCategory":mainCategory.id,
          "state":0
        });
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
        color: (mainCategory.isSelected ?? false) ? greenMoney.withOpacity(0.5) : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              mainCategory.sName ?? " ",
              style: AppStyles.textNormalBlackRegular,
            ),
            SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC"))
          ],
        ),
      ),
    );
  }
}
