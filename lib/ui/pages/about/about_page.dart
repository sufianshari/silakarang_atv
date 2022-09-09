import 'package:flutter/material.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String textDesc =
      'Silakarang ATV is an outdoor adventure type tourist spot located on Jl. Raya Singapadu No. 10, Singapadu Kaler, Kec. Sukawati, Gianyar Regency, Bali. Silakarang ATV has various types of tourist activities, such as ATV (All-Terrain Vehicle) games, white water rafting tours, giant swings, and Luwak coffee plantation tours. In addition there is also the Bubble Hotel which is located right on the edge of the Pakerisan river. The many outdoor tourist attractions at Silakarang ATV have attracted tourists since 2014.';
  String textKontak =
      'Jl. Raya Singapadu No. 10, Singapadu Kaler, Kec. Sukawati, Gianyar Regency, Bali \n+62 819-3434-6671\nFB : Silakarang Adventure';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Silakarang ATV",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/about.jpg',
                // width: 500,
                // height: 200.0,
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
              Text(
                textDesc,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Text(textKontak),
            ],
          ),
        ),
      ),
    );
  }
}
