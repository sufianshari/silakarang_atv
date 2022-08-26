import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:silakarang_atv/utilities/themes.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: greyColor300,
      highlightColor: greyColor100,
      child: Container(
        width: width * 0.75,
        height: 155,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
