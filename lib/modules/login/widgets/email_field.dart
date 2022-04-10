import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

Widget buildTextEmailField(
    {required String tittle,
      required TextEditingController textEditingController,
      required String hintText,}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width(16), bottom: height(12)),
          child: Text(
            tittle,
            style: GoogleFonts.sarabun(
                fontSize: size(16),
                fontWeight: FontWeight.w600,
                color: dark),
          ),
        ),
        Container(
            height: height(70),
            padding: EdgeInsets.only(
                left: width(16), bottom: height(12), right: width(16)),
            child: TextFormField(
              controller: textEditingController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppStyles.textSmallDarkNormal,
                contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: lightDarkHintText, width: 1.0),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: violet, width: 1.0),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: lightDarkHintText, width: 1.0),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ))
      ],
    ),
  );
}
