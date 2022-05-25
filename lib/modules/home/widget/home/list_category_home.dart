import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/constants/app_image.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';

class ListCategoryHome extends StatefulWidget {
  const ListCategoryHome({Key? key}) : super(key: key);

  @override
  State<ListCategoryHome> createState() => _ListCategoryHomeState();
}

class _ListCategoryHomeState extends State<ListCategoryHome> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: height(10), horizontal: width(5)),child: Text("Danh mục", style: AppStyles.textNormalGreenSemiBold,),),
          Container(
            height: height(300),
            child: GridView.count(
              physics:  ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.all(width(5)),
              crossAxisCount: 2,
              crossAxisSpacing: width(10),
              mainAxisSpacing: width(10),
              childAspectRatio: 1,
              children: <Widget>[
                buildItemCategory(MyImage.bikeImage,"Xe cộ", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments: {
                    "idMainCategory":1,
                    "nameCategory":"Xe cộ"
                  }
                  );
                }),
                buildItemCategory(MyImage.electricImage,"Đồ điện tử", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments: {
                    "idMainCategory":2,
                    "nameCategory":"Đồ điện tử"
                  }
                  );
                }),
                buildItemCategory(MyImage.storeImage,"Văn phòng phẩm", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments: {
                    "idMainCategory":3,
                    "nameCategory":"Văn phòng phẩm"
                  }
                  );
                }),
                buildItemCategory(MyImage.bookImage,"Tài liệu học tập", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments:
                  {
                    "idMainCategory":4,
                    "nameCategory":"Tài liệu học tập"
                  }
                  );
                }),
                buildItemCategory(MyImage.foodImage,"Đồ ăn thực phẩm", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments:
                  {
                    "idMainCategory":8,
                    "nameCategory":"Đồ ăn thực phẩm"
                  }
                  );
                }),
                buildItemCategory(MyImage.catImage,"Thú cưng", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments:
                  {
                    "idMainCategory":7,
                    "nameCategory":"Thú cưng"
                  }
                  );
                }),
                buildItemCategory(MyImage.houseImage,"Đồ gia dụng", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments:
                  {
                    "idMainCategory":5,
                    "nameCategory":"Đồ gia dụng"
                  }
                  );
                }),
                buildItemCategory(MyImage.manyImage,"Giải trí, thể thao", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments:
                  {
                    "idMainCategory":6,
                    "nameCategory":"Giải trí, thể thao"
                  });
                }),
                buildItemCategory(MyImage.manyImage,"Thời trang", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments: {
                    "idMainCategory":9,
                    "nameCategory":"Thời trang"
                  });
                }),
                buildItemCategory(MyImage.manyImage,"Đồ dùng cá nhân", (){
                  Get.toNamed(RouterLink.listCategoryPostPage, arguments: {
                    "idMainCategory":10,
                    "nameCategory":"Đồ dùng cá nhân"
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemCategory (String image, String text, VoidCallback onClick){
    return InkWell(
      onTap:  onClick,
      child: SizedBox(
       // margin: EdgeInsets.only(right: width(10)),
        width: width(130),
       child: Column(
         children: [
           Container(
             height: width(60),
             width: width(90),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
             ),
             child: ClipRRect(
               child: Image.asset(
                 image,
                 fit: BoxFit.cover,
               ),
               borderRadius: BorderRadius.circular(20),
             ),
           ),
           Container(
             height: height(10),
           ),
           Expanded(
             child: Text(
               text,
               maxLines: 2,
               style: AppStyles.textSmallGreenRegular,
               textAlign: TextAlign.center,
               overflow: TextOverflow.ellipsis,
             ),
           )
         ],
       ),
      ),
    );
  }
}
