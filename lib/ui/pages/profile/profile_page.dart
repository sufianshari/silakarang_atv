import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silakarang_atv/ui/pages/home/home_page.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 /*  String user_uid = '';
  String user_nama = '';
  String user_email = '';
  String user_phone = '';
  String user_aktif = ''; */

  @override
  void initState() {
    super.initState();
    // _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String authLogin = localStorage.getString('login').toString();

    if (authLogin != null) {
      setState(() {
       /*  user_uid = localStorage.getString('uid').toString();
        user_nama = localStorage.getString('nama').toString();
        user_email = localStorage.getString('email').toString();
        user_phone = localStorage.getString('phone').toString();
        user_aktif = localStorage.getString('aktif').toString(); */
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget listItem(String title, String link, Icon icon) {
      return Card(
        child: ListTile(
          title: Transform.translate(
            offset: const Offset(-15, 0),
            child: Text(title, style: primaryTextStyle),
          ),
          leading: icon,
          onTap: () {
            Get.toNamed(link);
          },
          trailing: const Icon(Icons.chevron_right),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Akun Profil',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: defaultMargin),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: infoColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: logout,
                child: Text(
                  "Log Out",
                  style: lightTextStyle.copyWith(
                    fontSize: 17,
                    fontWeight: regular,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          content(),
        ],
      ),
    );
  }

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      localStorage.remove('login');
      localStorage.remove('uid');
      localStorage.remove('nama');
      localStorage.remove('email');
      localStorage.remove('phone');
      localStorage.remove('aktif');
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const HomePage(),
      ),
      (route) => false,
    );
  }
}
