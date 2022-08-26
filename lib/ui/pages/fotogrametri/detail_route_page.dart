import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
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
      body: ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        // src: 'assets/route.glb', // a bundled asset file
        src: 'assets/car.glb', // a bundled asset file
        // src:'https://silakarang.tugas-akhir.web.id/uploads/route.glb?raw=true',
        alt: "Rute",
        ar: true,
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
        autoRotate: true,
        cameraControls: true,
        // iosSrc: 'https://silakarang.tugas-akhir.web.id/uploads/location.glb',
      ),
    );
  }
}
