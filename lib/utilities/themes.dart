import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 16.0;

Color primaryColor = const Color(0xffaf910e);
Color secondaryColor = const Color(0xffd5bb7b);
Color thirdColor = const Color(0xffd0bf74);
Color fourColor = const Color(0xffebe4c4);
Color successColor = const Color(0xff18bc9c);
Color infoColor = const Color(0xff3498db);
Color warningColor = const Color(0xfff39c12);
Color dangerColor = const Color(0xffe74c3c);
Color lightColor = const Color(0xffecf0f1);
Color darkColor = const Color(0xff7b8a8b);
Color alertColor = const Color(0xffED6363);
Color priceColor = const Color(0xff2C96F1);
Color primaryTextColor = const Color(0xffF1F0F2);
Color secondaryTextColor = const Color(0xff999999);
Color subtitleColor = const Color(0xff504F5E);
Color transparentColor = Colors.transparent;
Color blackColor = const Color(0xff2E2E2E);

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);
const kDarkPrimayColor = Color(0xff003d69);

const bgLayer1 = Color(0xffffffff);
const bgLayer2 = Color(0xfff9f9f9);
const bgLayer3 = Color(0xffe8ecf4);
const bgLayer4 = Color(0xffdcdee3);
const bgLayer5 = Color(0xff003d69);
const bgLayer6 = Color(0xff81d4fa);
const bgLayer7 = Color(0xffb3e5fc);
const bgLayer8 = Color(0xffe1f5fe);
const bgLayer9 = Color(0xffe0e0e0);

const disabledColor = Color(0xff636363);
const onDisabled = Color(0xffffffff);
const colorInfo = Color(0xffff784b);
const colorWarning = Color(0xffffc837);
const colorSuccess = Color(0xff3cd278);
const shadowColor = Color(0xffeaeaea);
const onInfo = Color(0xffffffff);
const onSuccess = Color(0xffffffff);
const onWarning = Color(0xffffffff);
const colorError = Color(0xfff0323c);
const onError = Color(0xffffffff);
const shimmerBaseColor = Color(0xFFF5F5F5);
const shimmerHighlightColor = Color(0xFFE0E0E0);
const textColor = Color(0xFFE08119);

Color backgroundColor1 = const Color(0xffe3e2dd);
Color backgroundColor2 = const Color(0xffd2d1cb);
Color backgroundColor3 = const Color(0xff90caf9);
Color backgroundColor4 = const Color(0xff64b5f6);
Color backgroundColor5 = const Color(0xff42a5f5);
Color backgroundColor6 = const Color(0xff2196f3);
Color backgroundColor7 = const Color(0xff1e88e5);
Color backgroundColor8 = const Color(0xff1976d2);
Color backgroundColor9 = const Color(0xff1565c0);
Color backgroundColor10 = const Color(0xff0d47a1);

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

Color greyColor100 = const Color(0xfff5f5f5);
Color greyColor300 = const Color(0xffe0e0e0);
Color greyColor500 = const Color(0xff9e9e9e);

TextStyle primaryTextStyle = GoogleFonts.roboto(
  color: primaryColor,
);

TextStyle secondaryTextStyle = GoogleFonts.roboto(
  color: secondaryColor,
);

TextStyle successTextStyle = GoogleFonts.roboto(
  color: successColor,
);

TextStyle infoTextStyle = GoogleFonts.roboto(
  color: infoColor,
);

TextStyle warningTextStyle = GoogleFonts.roboto(
  color: warningColor,
);

TextStyle dangerTextStyle = GoogleFonts.roboto(
  color: dangerColor,
);

TextStyle lightTextStyle = GoogleFonts.roboto(
  color: lightColor,
);

TextStyle darkTextStyle = GoogleFonts.roboto(
  color: darkColor,
);

TextStyle subtitleTextStyle = GoogleFonts.roboto(
  color: subtitleColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: primaryColor,
);
Widget loadingIndicator2 = SpinKitFadingCircle(
  size: 45,
  color: infoColor,
);

TextStyle blackFontStyle1 = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.roboto()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.roboto().copyWith(color: Colors.black);
