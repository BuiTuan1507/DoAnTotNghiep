


import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

Widget emptyComment() {
  
  return Visibility(
      visible: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MyImage.chatLogo,
              color: HexColor('CED4DA'),
              height: height(80),
              width: width(80),
            ),
            SizedBox(height: height(10)),
            Text(
              'Bạn chưa có đoạn chat nào',
              style: GoogleFonts.sarabun(
                  color: HexColor('CED4DA'), fontSize: size(20)
              ),
            )
          ],
        ),
      ));
}
