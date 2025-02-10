import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';

class Carousewidget extends StatelessWidget {
  const Carousewidget({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(AppConstans.Radious),
        bottomRight: Radius.circular(AppConstans.Radious),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.fill,
      ),
    ));
  }
}
