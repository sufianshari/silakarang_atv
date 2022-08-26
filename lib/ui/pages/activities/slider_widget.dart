import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:silakarang_atv/api/api_util.dart';
import 'dart:convert';

import 'package:silakarang_atv/ui/widgets/shimmer_widget.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class SliderWidget extends StatefulWidget {
  final String aktifitasid;
  const SliderWidget({Key? key, required this.aktifitasid}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;
  bool? _isConnected;

  final CarouselController _controller = CarouselController();
  List _loadedPhotos = [];

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      setState(() {
        _isConnected = true;
      });
    } else if (result == ConnectivityResult.mobile) {
      setState(() {
        _isConnected = true;
      });
    } else {
      setState(() {
        _isConnected = false;
      });
    }
  }

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    String url = ApiUtil.BASE_URL_API +
        '/list-galeri.php?aktifitas_id=' +
        widget.aktifitasid;

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body)['galeri'];

    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkConnectivityState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected == true
        ? _loadedPhotos.isEmpty
            ? const Center(
                child: ShimmerWidget(),
              )
            // The ListView that displays photos
            : Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: _loadedPhotos.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          ApiUtil.BASE_URL +
                              "uploads/foto_galeri/" +
                              _loadedPhotos[itemIndex]["galeri_foto"],
                          // width: 10000,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 8),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _loadedPhotos.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      currentIndex == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )
        : Center(
            child: Text(
              "Mohon cek koneksi internet Anda!",
              style: primaryTextStyle.copyWith(fontSize: 16),
            ),
          );
  }
}
