import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';

class TournamentDetailsTitle extends StatelessWidget {
  const TournamentDetailsTitle({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyleClass.getTextStyle("medium", AppConstans.Width * .045),
    );
  }
}
