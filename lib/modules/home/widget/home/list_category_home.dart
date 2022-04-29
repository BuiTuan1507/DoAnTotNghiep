import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/constants/app_image.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          GridView.count(
            physics:  ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(width(5)),
            crossAxisCount: 4,
            crossAxisSpacing: width(10),
            mainAxisSpacing: width(10),
            childAspectRatio: 0.65,
            children: <Widget>[
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
              buildItemCategory(MyImage.defaultImage,"Hoa Xoan"),
            ],
          )
        ],
      ),
    );
  }

  Widget buildItemCategory (String image, String text){
    return Container(
     // margin: EdgeInsets.only(right: width(10)),
      width: width(130),
     child: Column(
       children: <Widget>[
         Container(
           height: width(80),
           width: width(80),
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
         Text(
           text,
           style: AppStyles.textNormalBlackMedium,
           textAlign: TextAlign.center,
         )
       ],
     ),
    );
  }
}
