import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silakarang_atv/ui/pages/login/login_page.dart';
import 'package:silakarang_atv/ui/pages/profile/profile_page.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String user_uid = '';
  String user_nama = '';
  String user_email = '';
  String user_phone = '';
  String user_aktif = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String authLogin = localStorage.getString('login').toString();

    if (authLogin != null) {
      setState(() {
        user_uid = localStorage.getString('uid').toString();
        user_nama = localStorage.getString('nama').toString();
        user_email = localStorage.getString('email').toString();
        user_phone = localStorage.getString('phone').toString();
        user_aktif = localStorage.getString('aktif').toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Selamat Datang",
          style: primaryTextStyle,
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
                  icon: const Icon(
                    Icons.login_sharp,
                    color: Color(0xffaf910e),
                  ),
                  tooltip: 'Login Administrator',
                  onPressed: () {
                    Get.to(const LoginPage(),
                        transition: Transition.rightToLeft);
                  },
                )
          /* (user_uid.isEmpty)
              ? IconButton(
                  icon: const Icon(
                    Icons.login_sharp,
                    color: Color(0xffaf910e),
                  ),
                  tooltip: 'Login Administrator',
                  onPressed: () {
                    Get.to(const LoginPage(),
                        transition: Transition.rightToLeft);
                  },
                )
              : IconButton(
                  icon: const Icon(
                    Icons.people_alt_rounded,
                    color: Color(0xffaf910e),
                  ),
                  tooltip: 'User Login',
                  onPressed: () {
                    Get.to(const ProfilePage(),
                        transition: Transition.rightToLeft);
                  },
                ), */
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 120.0,
            height: 120.0,
          ),
          Center(
            child: Text(
              "Silakarang ATV",
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          listMenu(),
        ],
      ),
    );
  }

  Widget listMenu() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            listCard(
              'Activities',
              'List Activities',
              '/acitivities',
              FaIcon(
                FontAwesomeIcons.biking,
                size: 34,
                color: textColor,
              ),
            ),
            listCard(
              'Photogrammetry',
              '3D Photogrammetry',
              '/photogrametries',
              FaIcon(
                FontAwesomeIcons.servicestack,
                size: 34,
                color: textColor,
              ),
            ),
            listCard(
              'About Silakarang ATV',
              'Silakarang ATV Description',
              '/about',
              FaIcon(
                FontAwesomeIcons.infoCircle,
                size: 34,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card listCard(String title, String subtitle, String link, FaIcon faIcon) {
    return Card(
      child: ListTile(
        leading: faIcon,
        title: Transform.translate(
          offset: Offset(-10, 0),
          child: Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
        subtitle: Transform.translate(
          offset: Offset(-10, 0),
          child: Text(
            subtitle,
            style: secondaryTextStyle,
          ),
        ),
        onTap: () {
          Get.toNamed(link);
        },
      ),
    );
  }
}
