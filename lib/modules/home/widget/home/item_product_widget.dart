import 'package:do_an/utils/widget/cache_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class ItemProductWidget extends StatefulWidget {
  const ItemProductWidget({Key? key}) : super(key: key);

  @override
  State<ItemProductWidget> createState() => _ItemProductWidgetState();
}

class _ItemProductWidgetState extends State<ItemProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(180),
      width: height(180),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildImage(),
          buildNameProduct(),
          buildMoneyProduct(),
          buildTimeAndLocation()
        ],
      ),
    );
  }

  Widget buildImage() {
    return Stack(
      children: [
        Container(
          child: CacheImage(
            imageUrl: MyImage.imageBanner,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text("5", style: TextStyle(color: Colors.white),)
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Icon(Icons.favorite),
        )
      ],
    );
  }
  Widget buildNameProduct(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Text("Name Product"),
          Icon(Icons.more_vert)
        ],
      ),
    );
  }
  Widget buildMoneyProduct(){
    return Padding(
      padding: EdgeInsets.all(width(8)),
      child: Text("8 trieu/thang"),
    )
    ;
  }
  Widget buildTimeAndLocation(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("45 s truoc"),
          Text("Hoang Mai")
        ],
      ),
    );
  }
}
