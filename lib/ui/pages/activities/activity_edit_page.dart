import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silakarang_atv/models/dropdown_list.dart';
import 'package:silakarang_atv/providers/aktifitas_provider.dart';
import 'package:silakarang_atv/ui/widgets/textfield_widget.dart';
import 'package:silakarang_atv/utilities/themes.dart';
import 'package:ndialog/ndialog.dart';

class ActivityEditPage extends StatefulWidget {
  final String id;
  final String nama;
  final String hargamin;
  final String hargamax;
  final String desc;
  const ActivityEditPage(
      {Key? key,
      required this.id,
      required this.nama,
      required this.hargamin,
      required this.hargamax,
      required this.desc})
      : super(key: key);

  @override
  State<ActivityEditPage> createState() => _ActivityEditPageState();
}

class _ActivityEditPageState extends State<ActivityEditPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaMinController = TextEditingController();
  TextEditingController hargaMaxController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  late FocusNode nama;
  late FocusNode hargaMin;
  late FocusNode hargaMax;
  late FocusNode deskripsi;

  String _nama = '';
  String _hargaMin = '';
  String _hargaMax = '';
  String _deskripsi = '';
  String selectedStatus = 'Aktif';

  @override
  void initState() {
    super.initState();
    nama = FocusNode();
    hargaMin = FocusNode();
    hargaMax = FocusNode();
    deskripsi = FocusNode();

    namaController.text = widget.nama;
    hargaMinController.text = widget.hargamin;
    hargaMaxController.text = widget.hargamax;
    deskripsiController.text = widget.desc;
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    nama.dispose();
    hargaMin.dispose();
    hargaMax.dispose();
    deskripsi.dispose();
    [
      namaController,
      hargaMinController,
      hargaMaxController,
      deskripsiController,
    ].forEach((controller) => controller.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Activity",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTitle('Activity Name'),
                buildNama(),
                buildTitle('Activity Minimal Cost'),
                buildHargaMin(),
                buildTitle('Activity Maximal Cost'),
                buildHargaMax(),
                buildTitle('Description'),
                buildDeskripsi(),
                buildTitle('Status'),
                buildStatus(),
                buildTombol(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTombol(context) => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: defaultMargin),
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ElevatedButton(
          onPressed: () {
            ProgressDialog progressDialog = ProgressDialog(
              context,
              blur: 0,
              dialogTransitionType: DialogTransitionType.Shrink,
              title: Text("Silakarang ATV"),
              message: Text("Proses Kirim Data!"),
            );
            progressDialog.setLoadingWidget(CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ));
            progressDialog.setMessage(Text("Proses Kirim Data!"));
            // progressDialog.setTitle(Text("Proses"));
            progressDialog.show();

            _nama = namaController.text;
            _hargaMin = hargaMinController.text;
            _hargaMax = hargaMaxController.text;
            _deskripsi = deskripsiController.text;

            AktifitasProvider.sendAktivityEdit(
                    id: widget.id,
                    nama: _nama,
                    hargamin: _hargaMin,
                    hargamax: _hargaMax,
                    deskripsi: _deskripsi)
                .then((value) {
              progressDialog.dismiss();
              //ketika berhasil
              (value != null)
                  ? Get.offAllNamed('/')
                  : Get.snackbar(
                      "", "",
                      backgroundColor: Colors.red[500],
                      // icon: FaIcon(FontAwesomeIcons.timesCircle),
                      titleText: const Text('Gagal'),
                      messageText: const Text("Pengiriman Data Gagal"),
                    );
            }).catchError((e) {
              progressDialog.dismiss();
              Get.snackbar(
                "", "",
                backgroundColor: Colors.red[500],
                // icon: FaIcon(FontAwesomeIcons.timesCircle),
                titleText: const Text('Gagal'),
                messageText: const Text("Pengiriman Data Gagal"),
              );
            });
          },
          child: Text(
            'Update Data Aktifitas',
            style: GoogleFonts.roboto(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      );

  Widget buildTitle(String title) => Container(
        width: double.infinity,
        margin:
            EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 6),
        child: Text(
          title,
          style: blackFontStyle2,
        ),
      );

  Widget buildStatus() => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            hint: const Text("Pilih Status"),
            items: dropdownItemStatus,
            value: selectedStatus,
            onChanged: (value) {
              setState(() {
                selectedStatus = value.toString();
              });
            },
            // underline: SizedBox(),
          ),
        ),
      );

  Widget buildNama() {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 6),
      child: TextFieldWidget(
        hint: 'Masukkan Nama',
        inputType: TextInputType.text,
        icon: Icons.motorcycle,
        iconColor: primaryColor,
        textController: namaController,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {
          namaController.text;
        },
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(hargaMin);
        },
      ),
    );
  }

  Widget buildHargaMin() {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 6),
      child: TextFieldWidget(
        hint: 'Masukkan Harga Minimal',
        inputType: TextInputType.phone,
        icon: Icons.price_change_outlined,
        iconColor: primaryColor,
        textController: hargaMinController,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {
          hargaMinController.text;
        },
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(hargaMax);
        },
      ),
    );
  }

  Widget buildHargaMax() {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 6),
      child: TextFieldWidget(
        hint: 'Masukkan Harga Maksimal',
        inputType: TextInputType.number,
        icon: Icons.price_change_outlined,
        iconColor: primaryColor,
        textController: hargaMaxController,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {
          hargaMaxController.text;
        },
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(deskripsi);
        },
      ),
    );
  }

  Widget buildDeskripsi() => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: TextFormField(
          focusNode: deskripsi,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 10,
          controller: deskripsiController,
          decoration: InputDecoration(
            fillColor: lightColor,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: secondaryColor),
          ),
        ),
      );
}
