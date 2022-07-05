import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:silakarang_atv/models/aktifitas_model.dart';
import 'package:silakarang_atv/models/testimoni_model.dart';
import 'package:silakarang_atv/providers/testimoni_provider.dart';
import 'package:silakarang_atv/utilities/currency.dart';
import 'package:silakarang_atv/utilities/themes.dart';
import 'package:intl/intl.dart';

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
  List<TestimoniModel> testimonis = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future init() async {
    final testi = await TestimoniProvider.getTestimoni(idTestimoni: widget.id);
    setState(() => testimonis = testi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 120.0,
                height: 120.0,
              ),
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
              Html(data: widget.desc),
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
}
