// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:ecommerce/core/constans/constansappvalues.dart';
// import 'package:ecommerce/view/widget/productdetailwidgets/dropdownprodutdetails.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DropDownWidegt extends StatelessWidget {
//   final List<String> items;
//   final String hintText;
//   final DropdownChangeHandler<String> onChanged;
//   final String? selectedItem;
//   final String? labelText;
//   final String? errorText;
//   final bool isErrored;
//   final bool isenabled;
//   final bool isselected;
//   final Color? color;

//   const DropDownWidegt({
//     Key? key,
//     required this.items,
//     required this.hintText,
//     required this.onChanged,
//     this.selectedItem,
//     this.labelText,
//     this.errorText,
//     this.color,
//     this.isenabled = true,
//     this.isErrored = false,
//     this.isselected = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final borderRadius = BorderRadius.circular(AppConstans.Radious / 2);

//     // Responsiveness
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     double scaledPadding = screenWidth * 0.03;
//     double fontSize = screenHeight * 0.018;

//     return DropdownSearch<String>(
//       enabled: isenabled,
//       items: items,
//       selectedItem: selectedItem,
//       onChanged: (value) {
//         final index = items.indexOf(value!);
//         onChanged(value, index);
//       },
//       dropdownDecoratorProps: DropDownDecoratorProps(
//         dropdownSearchDecoration: InputDecoration(
//           filled: Get.isDarkMode,
//           fillColor: Get.isDarkMode
//               ? AppConstans.secondblackcolor
//               : AppConstans.Whitecolor,
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           label: labelText != null
//               ? Text(
//                   labelText!,
//                   style: TextStyle(
//                     color: AppConstans.darkgreycolor,
//                     fontWeight: FontWeight.w400,
//                     fontSize: fontSize,
//                   ),
//                 )
//               : null,
//           errorText: isErrored ? errorText : null,
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red),
//             borderRadius: borderRadius,
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Get.isDarkMode
//                     ? AppConstans.darkgreycolor
//                     : AppConstans.Bordercolor),
//             borderRadius: borderRadius,
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red),
//             borderRadius: borderRadius,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Get.isDarkMode
//                     ? AppConstans.darkgreycolor
//                     : AppConstans.Bordercolor),
//             borderRadius: borderRadius,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Get.isDarkMode
//                     ? AppConstans.darkgreycolor
//                     : AppConstans.Bordercolor),
//             borderRadius: borderRadius,
//           ),
//           hintText: hintText,
//           hintStyle: TextStyle(
//             fontSize: fontSize,
//             color: Get.isDarkMode
//                 ? const Color.fromARGB(255, 37, 0, 0)
//                 : const Color.fromARGB(255, 230, 64, 64),
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             vertical: scaledPadding,
//             horizontal: scaledPadding,
//           ),
//         ),
//       ),
//       dropdownBuilder: (context, selectedItem) {
//         return Text(
//           selectedItem ?? hintText,
//           style: TextStyle(
//             fontSize: fontSize,
//             color: selectedItem != null
//                 ? (Get.isDarkMode
//                     ? Colors.white
//                     : Colors.black) // Color based on mode
//                 : (Get.isDarkMode
//                     ? Colors.white
//                     : Colors.black), // Hint text color
//           ),
//         );
//       },
//       popupProps: PopupProps.menu(
//         showSelectedItems: true,
//         menuProps: MenuProps(
//           borderRadius: borderRadius,
//           backgroundColor: Get.isDarkMode
//               ? AppConstans.secondblackcolor
//               : AppConstans.Whitecolor,
//         ),
//         itemBuilder: (context, item, isSelected) {
//           return Container(
//             padding: EdgeInsets.symmetric(
//               vertical: scaledPadding,
//               horizontal: scaledPadding,
//             ),
//             child: Text(
//               item,
//               style: TextStyle(
//                 fontSize: fontSize,
//                 color: isSelected
//                     ? Get.isDarkMode
//                         ? AppConstans.maincolordarktheme
//                         : AppConstans.maincolorlighttheme // Selected item color
//                     : (Get.isDarkMode
//                         ? AppConstans.Whitecolor
//                         : AppConstans
//                             .blackcolor), // Unselected item color based on mode
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
