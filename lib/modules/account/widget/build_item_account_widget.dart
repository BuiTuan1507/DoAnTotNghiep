import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/utils.dart';

Widget buildItem(
    String? tittle, VoidCallback onClick, String icon, Color color) {
  return InkWell(
    onTap: onClick,
    child: Padding(
      padding:
      EdgeInsets.symmetric(horizontal: width(10), vertical: height(18)),
      child: Row(
        children: [
          Container(
              height: width(32),
              width: width(32),
              padding: EdgeInsets.all(width(6)),
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: SvgPicture.asset(
                icon,
                color: Colors.white,
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: width(15)),
              child: Text(
                tittle ?? "",
                style: AppStyles.textNormalBlackMedium,
              ),
            ),
          ),
          SvgPicture.asset(MyImage.rightArrow, color: HexColor("#6492BC"))
        ],
      ),
    ),
  );
}