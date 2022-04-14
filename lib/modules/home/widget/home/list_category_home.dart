import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/constants/app_image.dart';
import 'package:flutter/cupertino.dart';

class ListCategoryHome extends StatefulWidget {
  const ListCategoryHome({Key? key}) : super(key: key);

  @override
  State<ListCategoryHome> createState() => _ListCategoryHomeState();
}

class _ListCategoryHomeState extends State<ListCategoryHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      child: GridView.count(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        crossAxisCount: 4,
        crossAxisSpacing: width(5),
        mainAxisSpacing: 5.0,
        childAspectRatio: 0.7,
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
      ),
    );
  }

  Widget buildItemCategory (String image, String text){
    return Container(
      width: width(120),
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
           height: 7,
         ),
         Container(
           child: Text(
             text,
             style: TextStyle(fontSize: 18),
             textAlign: TextAlign.center,
           ),
         )
       ],
     ),
    );
  }
}
