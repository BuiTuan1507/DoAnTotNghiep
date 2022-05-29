import 'package:do_an/modules/product_detail/controller/report_post_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/app_styles.dart';
import '../../../utils/utils.dart';
import '../../add_post/widget/description_field.dart';

class ReportPostPage extends GetView<ReportPostController>{
  const ReportPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title:Text("Báo cáo bài đăng", style: AppStyles.textNormalWhiteSemiBold),
        backgroundColor: greenMoney,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildText(),
            buildTittlePostField(),
            buildInfoPostField(),
            buildButton(),
            SizedBox(height: height(15),),
            Obx(() => loadingLogin(controller.isLoading.value))
          ],
        ),
      ),
    );
  }
  Widget buildText(){
  return Center(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Text("Bài viết có vấn đề gì thế bạn ?", style: AppStyles.textNormalBlackMedium,),
    ),
  );
  }
  Widget buildTittlePostField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: width(20)),
              child: buildTittleField("Tiêu đề")),
          SizedBox(
            height: height(4),
          ),
          descriptionField(
              textEditingController: controller.tittleController,
              hintText: "Nhập tiêu đề ...",
              maxLines: 2,
              maxLength: 200,
              heightField: height(90))
        ],
      ),
    );
  }

  Widget buildInfoPostField() {
    return
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: width(20)),
                child: buildTittleField("Thông tin")),
            SizedBox(
              height: height(4),
            ),
            descriptionField(
                textEditingController: controller.contentController,
                hintText: "Nhập thông tin ...",
                maxLines: 10,
                maxLength: 1000,
                heightField: height(250))
          ],
        ),
      );
  }

  Widget buildTittleField(String tittle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(5)),
      child: RichText(
        text: TextSpan(
          text: tittle,
          style: AppStyles.textSmallBlackMedium,
          children: <TextSpan>[
            TextSpan(
              text: ' *',
              style: AppStyles.textTinyRedMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton (){
    return Container(
        child: ButtonApply(
          tittle: "Báo cáo bài đăng",
          style: AppStyles.textNormalWhiteSemiBold,
          onClick: () => {
            controller.addReportPost()
          },
          width: double.infinity,
          height: height(60),
          margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: greenMoney),
        ));
  }


}