import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import '../controller/login_controller.dart';

Widget buildTextPasswordField(
    {required String tittle,
      required TextEditingController textEditingController,
      required String hintText,bool? isVisibility,required VoidCallback changeVisibility}) {
  final LoginController loginController = Get.find();
  return  Container(
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
            obscureText: isVisibility ?? true,
            controller: textEditingController,
            maxLines: 1,
            onChanged: (value){
              loginController.validateLogin(value);
            },
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppStyles.textSmallDarkNormal,
                contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
                fillColor: Colors.white,
                border: AppStyles.borderDark,
                focusedBorder: AppStyles.borderGreen,
                enabledBorder: AppStyles.borderDark,
                suffixIcon: (isVisibility != null) ?  IconButton(
                    icon: Icon(
                        isVisibility
                            ? Icons.visibility
                            : Icons.visibility_off),color: isVisibility ? greenMoney : lightDarkHintText,
                    onPressed: () {
                      changeVisibility();
                    }) : Container()) ,
          ),
        )
      ],
    ),
  );
}

