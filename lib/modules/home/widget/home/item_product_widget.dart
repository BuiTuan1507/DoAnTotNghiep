import 'package:do_an/utils/widget/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../config/routes_link.dart';
import '../../../../utils/utils.dart';

class ItemProductWidget extends StatefulWidget {
  const ItemProductWidget({Key? key}) : super(key: key);

  @override
  State<ItemProductWidget> createState() => _ItemProductWidgetState();
}

class _ItemProductWidgetState extends State<ItemProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(RouterLink.productDetailPage);
      },
      child: Container(
        height: width(150),
        width: width(200),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: width(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildImage(),
            buildStatusPost(),
            Divider(
              endIndent: width(10),
              indent: width(10),
              thickness: height(1),
              color: grey_4,
            ),
            buildNameProduct(),
            buildMoneyProduct(),
            buildTimeAndLocation()
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Stack(
      children: [
        SizedBox(
          height: width(150),
          width: double.infinity,
          child: CacheImage(
            imageUrl: MyImage.imageBanner,
            boxFit: BoxFit.cover,
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: width(4)),
              padding: EdgeInsets.symmetric(
                  horizontal: height(7), vertical: height(7)),
              decoration: BoxDecoration(
                  border: Border.all(width: height(1), color: Colors.white),
                  shape: BoxShape.circle,
                  color: grey_6),
              child: Text(
                "5",
                style: AppStyles.textSmallGreenRegular,
              ),
            )),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(right: width(4)),
            padding: EdgeInsets.symmetric(
                horizontal: height(7), vertical: height(7)),
            child: Icon(
              Icons.favorite_border,
              color: red,
              size: size(20),
            ),
          ),
        )
      ],
    );
  }

  Widget buildStatusPost() {
    return Container(
      height: height(40),
      padding: EdgeInsets.symmetric(horizontal: width(5), vertical: height(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width(10)),
            child: Icon(
              Icons.favorite_border,
              size: size(20),
              color: red,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width(5)),
            child: Text(
              "1",
              style: AppStyles.textSmallBlackRegular,
            ),
          ),
          VerticalDivider(
            indent: height(5),
            endIndent: height(5),
            thickness: height(1),
            color: grey_4,
          ),
          Padding(
            padding: EdgeInsets.only(left: width(10)),
            child: Icon(
              Icons.star,
              size: size(20),
              color: Colors.amber,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width(5)),
            child: Text(
              "5",
              style: AppStyles.textSmallBlackRegular,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNameProduct() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(4), horizontal: width(3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Flexible(
              child: Text(
            "Name Product eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textSmallBlackMedium,
          )),
        ],
      ),
    );
  }

  Widget buildMoneyProduct() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(3)),
      child: Text(
        "8 trieu/thang",
        style: AppStyles.textSmallRedMedium,
      ),
    );
  }

  Widget buildTimeAndLocation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(4), horizontal: width(3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text("19/04", maxLines: 1, overflow: TextOverflow.ellipsis,style: AppStyles.textTinyStrongDarkRegular,)),
          const SizedBox(width:4),
          Expanded(child: Text("Hoang Mai", maxLines: 1, overflow: TextOverflow.ellipsis,style: AppStyles.textTinyStrongDarkRegular))
        ],
      ),
    );
  }
}
