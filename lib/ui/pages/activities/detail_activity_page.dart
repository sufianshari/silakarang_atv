import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndialog/ndialog.dart';
import 'package:silakarang_atv/models/testimoni_model.dart';
import 'package:silakarang_atv/providers/testimoni_provider.dart';
import 'package:silakarang_atv/ui/pages/activities/activity_add_galery_page.dart';
import 'package:silakarang_atv/ui/pages/activities/activity_edit_page.dart';
import 'package:silakarang_atv/ui/pages/activities/slider_widget.dart';
import 'package:silakarang_atv/ui/widgets/textfield_widget.dart';
import 'package:silakarang_atv/utilities/currency.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class AktifitasDetailPage extends StatefulWidget {
  final String id;
  final String title;
  final String hargamin;
  final String hargamax;
  final String desc;

  const AktifitasDetailPage(
      {Key? key,
      required this.id,
      required this.title,
      required this.hargamin,
      required this.hargamax,
      required this.desc})
      : super(key: key);

  @override
  State<AktifitasDetailPage> createState() => _AktifitasDetailPageState();
}

class _AktifitasDetailPageState extends State<AktifitasDetailPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  late FocusNode nama;
  late FocusNode email;
  late FocusNode deskripsi;

  String _nama = '';
  String _email = '';
  String _deskripsi = '';

  List<TestimoniModel> testimonis = [];
  // String query = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    nama.dispose();
    email.dispose();
    deskripsi.dispose();
    [
      namaController,
      emailController,
      deskripsiController,
    ].forEach((controller) => controller.dispose());
    super.dispose();
  }

  Future init() async {
    nama = FocusNode();
    email = FocusNode();
    deskripsi = FocusNode();

    final testi = await TestimoniProvider.getTestimoni(idTestimoni: widget.id);
    setState(() {
      testimonis = testi;
    });
  }

  Widget slider() {
    return SliderWidget(
      aktifitasid: widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo_outlined),
            tooltip: 'Add Galery Activity',
            onPressed: () {
              Get.to(const ActivityAddGaleryPage(),
                  transition: Transition.rightToLeft);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Activity',
            onPressed: () {
              Get.to(
                  ActivityEditPage(
                      id: widget.id,
                      nama: widget.title,
                      hargamin: widget.hargamin,
                      hargamax: widget.hargamax,
                      desc: widget.desc),
                  transition: Transition.rightToLeft);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              slider(),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                widget.title,
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                CurrencyFormat.convertToIdr(int.parse(widget.hargamin), 0) +
                    ' - ' +
                    CurrencyFormat.convertToIdr(int.parse(widget.hargamax), 0),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 8,
              ),
              // Html(data: widget.desc),
              Text(
                widget.desc,
                textAlign: TextAlign.justify,
              ),
              const Divider(color: Colors.grey),
              Text(
                "Testimoni Aktifitas",
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              (testimonis.length > 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: testimonis.length,
                      itemBuilder: (context, index) {
                        final beban = testimonis[index];
                        return buildTestimoni(beban);
                      },
                    )
                  : buildNoneTestimoni(),
              const Divider(color: Colors.grey),
              Text(
                "Tambah Testimoni",
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 14),
              ),
              buildTitle('Name'),
              buildNama(),
              buildTitle('Email'),
              buildEmail(),
              buildTitle('Review'),
              buildReview(),
              buildTombol(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNoneTestimoni() => Card(
        elevation: 5,
        child: Container(
          color: warningColor,
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Belum ada testimoni pada aktifitas ini!",
                style: lightTextStyle.copyWith(fontWeight: bold),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      );

  Widget buildTestimoni(TestimoniModel testimoniModel) => Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                testimoniModel.nama,
                style: primaryTextStyle.copyWith(fontWeight: bold),
                textAlign: TextAlign.justify,
              ),
              Text(
                testimoniModel.deskripsi,
                style: secondaryTextStyle,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      );

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
            _email = emailController.text;
            _deskripsi = deskripsiController.text;

            TestimoniProvider.sendTestimoni(
                    id: widget.id,
                    nama: _nama,
                    email: _email,
                    deskripsi: _deskripsi)
                .then((value) {
              progressDialog.dismiss();
              //ketika berhasil
              Get.offAllNamed('/');
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
            'Kirim Data Testimoni',
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
          FocusScope.of(context).requestFocus(email);
        },
      ),
    );
  }

  Widget buildEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 6),
      child: TextFieldWidget(
        hint: 'Masukkan Email',
        inputType: TextInputType.emailAddress,
        icon: Icons.price_change_outlined,
        iconColor: primaryColor,
        textController: emailController,
        inputAction: TextInputAction.next,
        autoFocus: false,
        onChanged: (value) {
          emailController.text;
        },
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(deskripsi);
        },
      ),
    );
  }

  Widget buildReview() => Container(
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
