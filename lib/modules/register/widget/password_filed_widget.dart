import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

Widget buildPasswordField(
    String hintText,
    VoidCallback changeVisibility,
    bool visibilityPassword,
    TextEditingController textEditingController,
    Function(String value) onChanged) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      child: TextFormField(
        obscureText: visibilityPassword,
        controller: textEditingController,
        maxLines: 1,
        onChanged: (value) {
          onChanged(value);
        },
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppStyles.textSmallDarkNormal,
            contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
            //  fillColor: Colors.white,
            border: AppStyles.borderDark,
            focusedBorder: AppStyles.borderGreen,
            enabledBorder: AppStyles.borderDark,
            suffixIcon: IconButton(
                icon: Icon(visibilityPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                color: visibilityPassword ? greenMoney : lightDarkHintText,
                onPressed: changeVisibility)),
      ));
}