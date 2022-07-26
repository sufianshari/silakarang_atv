import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silakarang_atv/ui/pages/about/about_page.dart';
import 'package:silakarang_atv/ui/pages/activities/activity_add_page.dart';
import 'package:silakarang_atv/ui/pages/activities/activity_edit_page.dart';
import 'package:silakarang_atv/ui/pages/activities/activity_page.dart';
import 'package:silakarang_atv/ui/pages/fotogrametri/detail_fotogrametri_page.dart';
import 'package:silakarang_atv/ui/pages/fotogrametri/detail_location_page.dart';
import 'package:silakarang_atv/ui/pages/fotogrametri/detail_route_page.dart';
import 'package:silakarang_atv/ui/pages/fotogrametri/fotogrametri_page.dart';
import 'package:silakarang_atv/ui/pages/home/home_page.dart';
import 'package:silakarang_atv/utilities/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silakarang ATV',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        scaffoldBackgroundColor: backgroundColor1,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          titleTextStyle: lightTextStyle,
        ),
      ),
      getPages: [
        GetPage(
            name: '/',
            page: () => const HomePage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/acitivities',
            page: () => const ActivitiesPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/photogrametries',
            page: () => const PhotogrametryPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/about',
            page: () => const AboutPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/activity-add',
            page: () => const ActivityAddPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/photogrametridetail',
            page: () => const PhotogrametryDetailPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/detaillocation',
            page: () => const DetailLocationPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/detailroute',
            page: () => const DetailRoutePage(),
            transition: Transition.rightToLeft),
      ],
    );
  }
}
