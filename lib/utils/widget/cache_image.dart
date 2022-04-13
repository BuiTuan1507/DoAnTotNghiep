import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an/utils/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CacheImage extends StatelessWidget {
  String? imageUrl;
  BoxFit? boxFit;
  double? width;
  double? height;

  CacheImage({this.imageUrl, this.boxFit, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (imageUrl != null && imageUrl != "") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: CachedNetworkImage(
          width: width,
          height: height,
          imageUrl: imageUrl!,
          fit: boxFit ?? BoxFit.contain,
          errorWidget: (context,_,__){
            return Image.asset(
              MyImage.defaultImage,
              fit: boxFit ?? BoxFit.contain,
            );
          },
        ),
      );
    } else {
      return Image.asset(
        MyImage.defaultImage,
        fit: boxFit ?? BoxFit.contain,
      );
    }
  }
}
