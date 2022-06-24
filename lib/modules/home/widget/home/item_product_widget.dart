import 'package:do_an/utils/widget/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/routes_link.dart';
import '../../../../models/user/post_user_model.dart';
import '../../../../utils/utils.dart';

class ItemProductWidget extends StatefulWidget {
  Posts post;
   ItemProductWidget({Key? key, required this.post}) : super(key: key);

  @override
  State<ItemProductWidget> createState() => _ItemProductWidgetState();
}

class _ItemProductWidgetState extends State<ItemProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(RouterLink.productDetailPage, arguments: widget.post.id);
      },
      child: Container(
        height: width(120),
        width: width(150),
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
    String image = MyImage.imageBanner;
    String lengthImage = "0";
    if(widget.post.media?.isNotEmpty == true){
      image = widget.post.media?.first.fileDownloadUri ?? MyImage.imageBanner;
      lengthImage = widget.post.media?.length.toString() ?? "0";
    }

    return Stack(
      children: [
        SizedBox(
          height: width(100),
          width: double.infinity,
          child: CacheImage(
            imageUrl: image ,
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
                lengthImage,
                style: AppStyles.textSmallGreenRegular,
              ),
            ))
      ],
    );
  }

  Widget buildStatusPost() {
    String likes = "0";
    String watches = "0";
    if(widget.post.liked != null){
      likes = widget.post.liked.toString();
    }
    if(widget.post.watch != null){
      watches = widget.post.watch.toString();
    }
    return Container(
      height: height(26),
      padding: EdgeInsets.only(left: width(5), right:width(5) ,top: height(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width(10)),
            child: widget.post.isLike! ? Icon(
              Icons.favorite,
              size: size(20),
              color: red.withOpacity(0.7),
            ) :  Icon(
              Icons.favorite_border,
              size: size(20),
              color: red.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width(5)),
            child: Text(
              likes,
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
            child: SvgPicture.asset(MyIcon.watchIcon, color: black,),
          ),
          Padding(
            padding: EdgeInsets.only(right: width(5)),
            child: Text(
              watches,
              style: AppStyles.textSmallBlackRegular,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNameProduct() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(3), horizontal: width(3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Flexible(
              child: Text(
            widget.post.content ?? '',
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
        CommonUtil.formatMoney(widget.post.money ?? 0),
        style: AppStyles.textSmallRedMedium,
      ),
    );
  }

  Widget buildTimeAndLocation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(4), horizontal: width(3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text(CommonUtil.parseDateTime(widget.post.createTime ?? ""), maxLines: 1, overflow: TextOverflow.ellipsis,style: AppStyles.textTinyStrongDarkRegular,)),
          const SizedBox(width:4),
          Expanded(child: Text(widget.post.address ?? "", maxLines: 2, overflow: TextOverflow.ellipsis,style: AppStyles.textTinyStrongDarkRegular))
        ],
      ),
    );
  }
}
