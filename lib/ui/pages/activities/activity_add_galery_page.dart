import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:silakarang_atv/api/api_util.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class ActivityAddGaleryPage extends StatefulWidget {
  final String id;
  const ActivityAddGaleryPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ActivityAddGaleryPage> createState() => _ActivityAddGaleryPageState();
}

class _ActivityAddGaleryPageState extends State<ActivityAddGaleryPage> {
  List<File> fileList = [];
  XFile? img1, img2, img3;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Silahkan pilih file/gambar dengan menekan tombol kamera (+)'),
            )),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: (1 / 1.5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  pickImage1(context),
                  img1 != null ? pickImage2(context) : Container(),
                  img2 != null ? pickImage3(context) : Container(),
                ],
              ),
            ),
            img1 == null
                ? Container()
                : Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        'Upload Foto',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget pickImage1(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: bgLayer3,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _showPicker(context, 1);
                },
                child: Container(
                  child: img1 != null
                      ? ClipRRect(
                          child: Image.file(
                            File(img1!.path),
                            width: 100,
                            height: 130,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          width: 100,
                          height: 130,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
              Center(
                child: Text(
                  'Gambar 1',
                  style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pickImage2(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: bgLayer3,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _showPicker(context, 2);
                },
                child: Container(
                  child: img2 != null
                      ? ClipRRect(
                          child: Image.file(
                            File(img2!.path),
                            width: 100,
                            height: 130,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          width: 100,
                          height: 130,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
              Center(
                child: Text(
                  'Gambar 2',
                  style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pickImage3(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: bgLayer3,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _showPicker(context, 3);
                },
                child: Container(
                  child: img3 != null
                      ? ClipRRect(
                          child: Image.file(
                            File(img3!.path),
                            width: 100,
                            height: 130,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          width: 100,
                          height: 130,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
              Center(
                child: Text(
                  'Gambar 3',
                  style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _imgFromCamera(int numImage) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    fileList.add(File(image!.path));
    if (numImage == 1) {
      setState(() {
        img1 = image;
      });
    }
    if (numImage == 2) {
      setState(() {
        img2 = image;
      });
    }
    if (numImage == 3) {
      setState(() {
        img3 = image;
      });
    }
  }

  _imgFromGallery(int numImage) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    fileList.add(File(image!.path));
    if (numImage == 1) {
      setState(() {
        img1 = image;
      });
    }
    if (numImage == 2) {
      setState(() {
        img2 = image;
      });
    }
    if (numImage == 3) {
      setState(() {
        img3 = image;
      });
    }
  }

  void _showPicker(context, int numImage) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Galeri Foto'),
                    onTap: () {
                      _imgFromGallery(numImage);
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Kamera'),
                  onTap: () {
                    _imgFromCamera(numImage);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
