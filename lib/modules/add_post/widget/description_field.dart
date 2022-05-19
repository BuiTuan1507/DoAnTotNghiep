
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

Widget descriptionField({required String hintText, required int maxLines, required int maxLength, required double heightField, required TextEditingController textEditingController}){
  return Container(
      height: heightField,
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      margin: EdgeInsets.symmetric(vertical: height(10)),
      child: TextFormField(
         controller: textEditingController,
          onChanged: (text) {
        //    controller.validateAddTransaction();
          },
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: InputDecoration(
            border: AppStyles.borderDark,
            focusedBorder: AppStyles.borderGreen,
            enabledBorder: AppStyles.borderDark,
            hintText: hintText,
            alignLabelWithHint: false,
            hintStyle: GoogleFonts.sarabun(
                fontSize: size(14), color: lightDarkHintText),
            contentPadding: EdgeInsets.all(width(8)),
          )));
}