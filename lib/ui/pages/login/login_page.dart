import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silakarang_atv/api/api_util.dart';
import 'package:silakarang_atv/providers/login_provider.dart';
import 'package:silakarang_atv/ui/widgets/textfield_widget.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errormsg = "";
  bool error = false, showprogress = false;
  String email = "", password = "";

  final TextEditingController _usernameController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  late FocusNode _passwordFocusNode;

  // bool isAuth = false;
  // bool isLoading = false;

  startLogin() async {
    String apiurl = ApiUtil.BASE_URL_API + 'login-admin.php';
    print(password);

    var response = await http.post(Uri.parse(apiurl), body: {
      'email': email, //get the email text
      'password': password //get password text
    });

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        setState(() {
          showprogress = false; //don't show progress indicator
          error = true;
          errormsg = jsondata["msg"];
        });
      } else {
        print(jsondata["data"]["nama"]);

        setState(() {
          error = false;
          showprogress = false;
        });
        //save the data returned from server
        String uid = jsondata["data"]["id"];
        String nama = jsondata["data"]["nama"];
        String email = jsondata["data"]["email"];
        String phone = jsondata["data"]["phone"];
        String aktif = jsondata["data"]["aktif"];

        //simpan di local DB
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('login', 'adminlogin');
        localStorage.setString('uid', uid);
        localStorage.setString('nama', nama);
        localStorage.setString('email', email);
        localStorage.setString('phone', phone);
        localStorage.setString('aktif', aktif);

        //and navigate to home page
        Get.offAllNamed('/');
      }
    } else {
      setState(() {
        showprogress = false; //don't show progress indicator
        error = true;
        errormsg = "Error during connecting to server.";
      });
    }
  }

  @override
  void initState() {
    email = "";
    password = "";
    errormsg = "";
    error = false;
    showprogress = false;
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            email = value;
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
            password = value;
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
        onPressed: () {
          setState(() {
            //show progress indicator on click
            showprogress = true;
          });
          startLogin();
        },
        child: showprogress
            ? SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange[100],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.deepOrangeAccent),
                ),
              )
            : Text(
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
                      Container(
                        //show error message here
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.all(10),
                        child: error ? errmsg(errormsg) : Container(),
                        //if error == true then show error message
                        //else set empty container as child
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

  Widget errmsg(String text) {
    //error message widget.
    return Container(
      padding: const EdgeInsets.all(15.00),
      margin: const EdgeInsets.only(bottom: 8.00),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          border: Border.all(color: Colors.red, width: 2)),
      child: Row(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 6.00),
          child: const Icon(Icons.info, color: Colors.white),
        ), // icon for error message

        Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
        //show error message text
      ]),
    );
  }
}
