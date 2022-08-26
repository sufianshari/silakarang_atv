import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class DetailLocationPage extends StatefulWidget {
  const DetailLocationPage({Key? key}) : super(key: key);

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
      body: ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: 'assets/location.glb', // a bundled asset file
        // src:'https://silakarang.tugas-akhir.web.id/uploads/location.glb?raw=true',
        alt: "Lokasi",
        ar: true,
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
        autoRotate: true,
        cameraControls: true,
        // iosSrc: 'https://silakarang.tugas-akhir.web.id/uploads/location.glb',
      ),
    );
  }
}
