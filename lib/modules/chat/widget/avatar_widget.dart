import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

Widget buildAvatarUser({required String imageUrl, required double size}){
  return (imageUrl != "")
      ? CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, image) {
      return Container(
        height: width(size),
        width: width(size),
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            shape: BoxShape.circle
        ),
      );
    },
    placeholder: (context, image) {
      return Container(
        height: width(size),
        width: width(size),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(Constants.AVATAR_URL),
                fit: BoxFit.cover),
            shape: BoxShape.circle),
      );
    },
  )
      : Container(
    height: width(size),
    width: width(size),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(Constants.AVATAR_URL),
            fit: BoxFit.cover),
        shape: BoxShape.circle),
  );
}