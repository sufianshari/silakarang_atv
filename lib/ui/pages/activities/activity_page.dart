import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:silakarang_atv/models/aktifitas_model.dart';
import 'package:silakarang_atv/providers/aktifitas_provider.dart';
import 'package:silakarang_atv/ui/pages/activities/detail_activity_page.dart';
import 'package:silakarang_atv/ui/widgets/search_widget.dart';
import 'package:silakarang_atv/utilities/currency.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<AktifitasModel> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await AktifitasProvider.getAktifitas(query);
    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Activities",
          style: lightTextStyle,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final layanan = books[index];
                  return buildAktifitas(layanan);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Pencarian',
        onChanged: searchAktifitas,
      );

  Future searchAktifitas(String query) async => debounce(() async {
        final books = await AktifitasProvider.getAktifitas(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

  Widget buildAktifitas(AktifitasModel aktifitasModel) => InkWell(
        onTap: () {
          Get.to(
              AktifitasDetailPage(
                  id: aktifitasModel.id,
                  title: aktifitasModel.nama,
                  hargamin: aktifitasModel.harga_min,
                  hargamax: aktifitasModel.harga_max,
                  desc: aktifitasModel.desc),
              transition: Transition.rightToLeft);
        },
        child: Card(
          elevation: 5,
          child: ListTile(
              title: Text(
                aktifitasModel.nama,
                style: primaryTextStyle,
              ),
              subtitle: Text(
                CurrencyFormat.convertToIdr(
                        int.parse(aktifitasModel.harga_min), 0) +
                    ' - ' +
                    CurrencyFormat.convertToIdr(
                        int.parse(aktifitasModel.harga_max), 0),
                style: secondaryTextStyle,
              ),
              trailing: const FaIcon(FontAwesomeIcons.caretRight)),
        ),
      );
}
