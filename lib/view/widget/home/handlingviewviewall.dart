import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HandlingView extends StatelessWidget {
  const HandlingView({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
        baseColor: isDarkMode ? Colors.white12 : Colors.grey.shade300,
        highlightColor: isDarkMode ? Colors.white24 : Colors.grey.shade100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenWidth * .03),
          child: ListView(
            children: [
              SizedBox(
                height: ScreenHight * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: ScreenHight * .035,
                    width: ScreenWidth * .03,
                    color: AppConstans.Whitecolor,
                  ),
                  Spacer(),
                  Container(
                    height: ScreenHight * .035,
                    width: ScreenWidth * .03,
                    color: AppConstans.Whitecolor,
                  ),
                ],
              ),
              Container(
                height: ScreenHight * .02,
                width: ScreenWidth * .8,
                color: AppConstans.Whitecolor,
              ),
              SizedBox(
                height: ScreenHight * .02,
              ),
              Container(
                height: ScreenHight * .08,
                width: ScreenWidth * .8,
                color: AppConstans.Whitecolor,
              ),
              SizedBox(
                height: ScreenHight * .030,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: ScreenHight * .08,
                        width: ScreenWidth * .1,
                        color: AppConstans.Whitecolor,
                      ),
                      Spacer(),
                      Container(
                        height: ScreenHight * .05,
                        color: AppConstans.Whitecolor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Card(
                      elevation: .118,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              height: ScreenHight * .3,
                              width: ScreenWidth * .8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppConstans.Whitecolor,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: ScreenWidth * .03,
                                  color: AppConstans.Whitecolor,
                                ),
                                SizedBox(
                                  width: ScreenWidth * .8,
                                ),
                                Container(
                                  width: ScreenWidth * .03,
                                  color: AppConstans.Whitecolor,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: ScreenWidth * .04,
                                color: AppConstans.Whitecolor,
                              ),
                              SizedBox(
                                width: ScreenWidth * .16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenHight * .025,
                  ),
                  Row(
                    children: [
                      Container(
                        height: ScreenHight * .08,
                        width: ScreenWidth * .1,
                        color: AppConstans.Whitecolor,
                      ),
                      Spacer(),
                      Container(
                        height: ScreenHight * .05,
                        color: AppConstans.Whitecolor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Card(
                      elevation: .118,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              height: ScreenHight * .3,
                              width: ScreenWidth * .8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppConstans.Whitecolor,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: ScreenWidth * .03,
                                  color: AppConstans.Whitecolor,
                                ),
                                SizedBox(
                                  width: ScreenWidth * .8,
                                ),
                                Container(
                                  width: ScreenWidth * .03,
                                  color: AppConstans.Whitecolor,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: ScreenWidth * .04,
                                color: AppConstans.Whitecolor,
                              ),
                              SizedBox(
                                width: ScreenWidth * .16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Card(
                  elevation: .118,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          height: ScreenHight * .3,
                          width: ScreenWidth * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppConstans.Whitecolor,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Container(
                              width: ScreenWidth * .03,
                              color: AppConstans.Whitecolor,
                            ),
                            SizedBox(
                              width: ScreenWidth * .8,
                            ),
                            Container(
                              width: ScreenWidth * .03,
                              color: AppConstans.Whitecolor,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: ScreenWidth * .04,
                            color: AppConstans.Whitecolor,
                          ),
                          SizedBox(
                            width: ScreenWidth * .16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
