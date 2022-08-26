import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silakarang_atv/providers/login_provider.dart';
import 'package:silakarang_atv/ui/widgets/textfield_widget.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  late FocusNode _passwordFocusNode;

  bool isAuth = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getAktif();
    startTimer();
    _passwordFocusNode = FocusNode();
  }

  Future<void> getAktif() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('aktif');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
      print("aktif = " + token);
    }
  }

  startTimer() {
    var _duration = const Duration(milliseconds: 2000);
    return Timer(_duration, cekLogin);
  }

  cekLogin() async {
    if (isAuth) {
      Get.toNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    //proses login
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await AuthProvider().login(
        email: _usernameController.text,
        password: _passwordController.text,
      )) {
        Get.offAllNamed('/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: const Text(
              'Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget _logo() => Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 120,
          ),
        );

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: TextFieldWidget(
          hint: 'Masukkan Username',
          inputType: TextInputType.text,
          icon: Icons.person,
          iconColor: primaryColor,
          textController: _usernameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _usernameController.text;
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: TextFieldWidget(
          hint: 'Masukkan Password',
          isObscure: true,
          icon: Icons.lock,
          iconColor: primaryColor,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          onChanged: (value) {
            _passwordController.text;
          },
        ),
      );
    }

    Widget signInButton() {
      return MaterialButton(
        height: 50,
        minWidth: double.infinity,
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: handleSignIn,
        child: Text(
          "Log In",
          style: lightTextStyle.copyWith(
            fontSize: 17,
            fontWeight: regular,
            letterSpacing: 0.5,
          ),
        ),
      );
    }

    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login Administrator"),
      ),
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 50.0, left: defaultMargin, right: defaultMargin),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _logo(),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        'Login Administrator',
                        style: primaryTextStyle.copyWith(fontSize: 24),
                      ),
                      emailInput(),
                      passwordInput(),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      signInButton(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
