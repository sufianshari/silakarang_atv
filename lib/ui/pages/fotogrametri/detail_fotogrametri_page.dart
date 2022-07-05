import 'package:flutter/material.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class PhotogrametryDetailPage extends StatefulWidget {
  const PhotogrametryDetailPage({Key? key}) : super(key: key);

  @override
  State<PhotogrametryDetailPage> createState() => _PhotogrametryDetailPageState();
}

class _PhotogrametryDetailPageState extends State<PhotogrametryDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photogrametry Silakarang ATV",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Tampilan 3D Fotogrametri"),
          ],
        ),
      ),
    );
  }
}
