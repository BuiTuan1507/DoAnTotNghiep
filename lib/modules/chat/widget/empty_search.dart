
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

Widget emptySearch({required String keyword}) {
  return Container(
    padding:
    EdgeInsets.only(top: height(32), left: width(60), right: width(60)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Không tìm thấy kết quả phù hợp với",
                style: GoogleFonts.sarabun(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: size(18),
                    color: HexColor("#000000")),
              ),
              TextSpan(
                  text: " \"" + keyword + "\"",
                  style: GoogleFonts.sarabun(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: size(18))),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Xin bạn chắc chắn rằng tất cả từ khóa đều đúng chính tả. Hãy vui lòng thử lại",
          textAlign: TextAlign.center,
          style: GoogleFonts.sarabun(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: size(14),
              color: HexColor("#555555")),
        )
      ],
    ),
  );
}
