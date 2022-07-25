import 'package:flutter/material.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class ActivityAddGaleryPage extends StatefulWidget {
  const ActivityAddGaleryPage({Key? key}) : super(key: key);

  @override
  State<ActivityAddGaleryPage> createState() => _ActivityAddGaleryPageState();
}

class _ActivityAddGaleryPageState extends State<ActivityAddGaleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Galery Activity",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(child: Text('add galery activity')),
    );
  }
}
