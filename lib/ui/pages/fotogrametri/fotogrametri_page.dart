import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class PhotogrametryPage extends StatefulWidget {
  const PhotogrametryPage({Key? key}) : super(key: key);

  @override
  State<PhotogrametryPage> createState() => _PhotogrametryPageState();
}

class _PhotogrametryPageState extends State<PhotogrametryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photogrametry",
          style: lightTextStyle,
        ),
        centerTitle: true,
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
              'Location Silakarang ATV',
              'Location',
              '/photogrametridetail',
              FaIcon(
                FontAwesomeIcons.road,
                size: 34,
                color: textColor,
              ),
            ),
            listCard(
              'Routes Silakarang ATV',
              'Routes of adventures',
              '/photogrametridetail',
              FaIcon(
                FontAwesomeIcons.route,
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
