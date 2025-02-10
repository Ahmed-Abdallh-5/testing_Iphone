import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 2, 26),
      body: SizedBox(
        height: 400, // Adjust the height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.02,
                  right: screenWidth * 0.02,
                ),
                child: Card(
                  elevation: Theme.of(context).brightness == ThemeData.dark()
                      ? 0.118
                      : 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Stack(children: [
                            Container(
                              height: screenHeight * 0.3,
                              width: screenWidth * 0.75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.04),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.04),
                                child: Image.asset(
                                  "images/padel sport.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ])),
                      Container(
                        width: 300,
                        child: Row(
                          children: [Text("data"), Spacer(), Text("data")],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
