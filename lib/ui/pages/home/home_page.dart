import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:silakarang_atv/ui/pages/login/login_page.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            icon: const Icon(Icons.login_sharp),
            tooltip: 'Login Administrator',
            onPressed: () {
              Get.to(const LoginPage(), transition: Transition.rightToLeft);
            },
          ),
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
