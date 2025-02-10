import 'package:ecommerce/controller/productdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String locale;

  const CustomDatePicker({this.locale = 'en', Key? key}) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();
  ProductDetailsConimble productDetailsConimble =
      Get.put(ProductDetailsConimble());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    DateTime today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    int daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;

    int startDay = today.day;
    if (selectedDate.month != today.month || selectedDate.year != today.year) {
      startDay = 1;
    }

    bool isCurrentMonth =
        selectedDate.year == today.year && selectedDate.month == today.month;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
              onPressed: isCurrentMonth
                  ? null // Disable the button if it's the current month
                  : () {
                      setState(() {
                        selectedDate = DateTime(
                          selectedDate.year,
                          selectedDate.month - 1,
                          1,
                        );
                      });
                    },
            ),
            Text(
              DateFormat.MMMM(widget.locale).format(selectedDate),
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode == true
                    ? AppConstans.Whitecolor
                    : AppConstans.blackcolor,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onPressed: () {
                setState(() {
                  selectedDate = DateTime(
                    selectedDate.year,
                    selectedDate.month + 1,
                    1,
                  );
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: screenHeight * 0.1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: daysInMonth - startDay + 1,
            itemBuilder: (context, index) {
              DateTime date = DateTime(
                selectedDate.year,
                selectedDate.month,
                startDay + index,
              );

              bool isSelected = date.day == selectedDate.day &&
                  date.month == selectedDate.month &&
                  date.year == selectedDate.year;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    productDetailsConimble.dateOnly =
                        DateFormat('yyyy-MM-dd').format(date);
                    selectedDate = date;
                    productDetailsConimble.formattedDate =
                        DateFormat('EEEE d MMM').format(date);
                  });
                },
                child: Container(
                  width: screenWidth * 0.1,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Get.isDarkMode
                            ? AppConstans.maincolordarktheme
                            : AppConstans.maincolorlighttheme
                        : const Color.fromARGB(255, 165, 165, 165),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: CircleAvatar(
                          radius: screenWidth * 0.04,
                          backgroundColor: Get.isDarkMode == true
                              ? AppConstans.blackcolor
                              : AppConstans.Whitecolor,
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Get.isDarkMode == true
                                  ? AppConstans.Whitecolor
                                  : AppConstans.blackcolor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('EE', widget.locale).format(date),
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
