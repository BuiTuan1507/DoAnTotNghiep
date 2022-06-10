import 'package:do_an/modules/notification/controller/rating_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../add_post/widget/description_field.dart';

class RatingPostPage extends GetView<RatingPostController>{
  const RatingPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Đánh giá",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: greenMoney,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildStar(),
            buildComment(),
            SizedBox(height: height(50),),
            buildButtonAddRating()
          ],
        ),
      ),
    );
  }

  Widget buildStar (){
    return Container(
      padding: EdgeInsets.only(top: height(60)),
      child: Center(
        child: RatingBar.builder(
          initialRating: controller.ratingPost.value,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: width(3)),
          itemBuilder: (context, _) =>  Icon(
            Icons.star,
            color: amber
          ),
          onRatingUpdate: (rating) {
            controller.ratingPost.value = rating;
          },
        ),
      ),
    );
  }
  Widget buildComment(){
    return Container(
      padding: EdgeInsets.only(top: height(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(20)),
            child: Text("Phản hồi của bạn (không bắt buộc) :", style: AppStyles.textSmallBlackMedium,),
          ),
          SizedBox(height: height(20),),
          descriptionField(
              textEditingController: controller.textEditingController,
              hintText: "Nhập thông tin ...",
              maxLines: 10,
              maxLength: 1000,
              heightField: height(250))
        ],
      ),
    );
  }

  Widget buildButtonAddRating (){
    return Container(
      padding: EdgeInsets.only(top: height(50)),
        child: ButtonApply(
          tittle: "Gửi đánh giá",
          style: AppStyles.textNormalWhiteSemiBold,
          onClick: () => {
            controller.sendRating()
          },
          width: double.infinity,
          height: height(60),
          margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: greenMoney),
        ));
  }

}