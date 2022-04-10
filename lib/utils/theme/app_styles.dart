import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final double borderSizeNormal = 0.5.w;
final double borderSizeTextField = 1.0.w;

final  double paddingExtra = 30.0.w;
final  double paddingNormal = 20.0.w;
final  double paddingMedium = 15.0.w;
final  double paddingMin = 10.0.w;
final  double paddingDialog = 16.0.w;

final  double buttonSizeDefaultWidth = 335.0.w;
final  buttonSizeDefaultHeight = 44.0.h;

final  double iconSizeDefault = size(24);
const  double iconSizeLogo = 70.0;
const  double iconSizeAvatar = 60.0;
final  appBarIconSize = 24.0.w;
const  borderTextField = 6.0;


class AppStyles{
  static double fontSizeTiny = 12.0.sp;
  static double fontSizeSmall = 14.0.sp;
  static double fontSizeNormal = 16.0.sp;
  static double fontSizeLarge = 18.0.sp;
  static double fontSizeXL = 20.0.sp;
  static double fontSize2XL = 24.0.sp;


  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;


  static TextStyle textTitleAppBar = GoogleFonts.sarabun(
    fontSize: fontSizeLarge,
    fontWeight: fontWeightSemiBold,
    color: black
  );

  static  TextStyle textSmallDarkNormal = GoogleFonts.sarabun(
    fontSize: fontSizeSmall,
    fontWeight:fontWeightMedium,
    color: lightDarkHintText
  );

  static TextStyle textXLBlackSemiBold = GoogleFonts.sarabun(
      fontSize: fontSizeXL,
      fontWeight:fontWeightSemiBold,
      color: black
  );
  static TextStyle textSmallGreenRegular = GoogleFonts.sarabun(
      fontSize: fontSizeSmall,
      fontWeight:fontWeightRegular,
      color: greenMoney
  );
  static TextStyle textNormalWhiteSemiBold = GoogleFonts.sarabun(
    fontSize:fontSizeNormal,
    fontWeight: fontWeightSemiBold,
    color: Colors.white
  );
  static TextStyle textSmallDarkRegular = GoogleFonts.sarabun(
      fontSize: fontSizeSmall,
      fontWeight: fontWeightRegular,
      color: lightDarkHintText
  );
  static TextStyle textSmallGreenSemiBold = GoogleFonts.sarabun(
      fontSize: fontSizeSmall,
      fontWeight: fontWeightSemiBold,
      color: greenMoney);
}