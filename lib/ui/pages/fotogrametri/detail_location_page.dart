import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class DetailLocationPage extends StatefulWidget {
  const DetailLocationPage({ Key? key }) : super(key: key);

  @override
  State<DetailLocationPage> createState() => DetailLocationPageState();
}

class DetailLocationPageState extends State<DetailLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location Silakarang ATV",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(Object(fileName: 'assets/ball/ball.obj'));
          },
        ),
      ),
    );
  }
}