import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class DetailRoutePage extends StatefulWidget {
  const DetailRoutePage({Key? key}) : super(key: key);

  @override
  State<DetailRoutePage> createState() => _DetailRoutePageState();
}

class _DetailRoutePageState extends State<DetailRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Route Silakarang ATV",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(Object(fileName: 'assets/route/route.obj'));
          },
        ),
      ),
    );
  }
}
