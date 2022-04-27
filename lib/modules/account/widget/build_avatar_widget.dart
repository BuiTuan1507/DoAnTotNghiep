
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

Widget buildAvatar(String? image, double size) {
  return CachedNetworkImage(
    imageUrl: image ?? Constants.AVATAR_URL,
    imageBuilder: (context, image) {
      return Container(
        height: height(size),
        width: height(size),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: greenMoney,
            )),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            shape: BoxShape.circle,
          ),
        ),
      );
    },
    errorWidget: (context, url, error) => Container(
      height: height(size),
      width: height(size),
      decoration: BoxDecoration(
          image: DecorationImage(image:  NetworkImage(Constants.AVATAR_URL), fit: BoxFit.cover),
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: greenMoney,
          )),
    ),
    placeholder: (context, url) => CircularProgressIndicator(),
  );
}