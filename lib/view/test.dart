// import 'package:ecommerce/controller/testcontroller.dart';
// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Testcontroller controller = Get.put(Testcontroller());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("title"),
//       ),
//       body: GetBuilder<Testcontroller>(builder: (controller) {
//         if (controller.statueRequest == StatueRequest.loading) {
//           return Center(
//             child: Column(
//               children: [
//                 Lottie.asset('lottie/Animation - 1710885863787.json'),
//               ],
//             ),
//           );
//         } else if (controller.statueRequest == StatueRequest.ServerFaliure) {
//           return Center(
//             child: Column(
//               children: [
//                 Lottie.asset('lottie/Animation - 1710885863787.json'),
//               ],
//             ),
//           );
//         } else if (controller.statueRequest == StatueRequest.offline) {
//           return Center(
//             child: Column(
//               children: [
//                 Lottie.asset('lottie/Animation - 1710885863787.json',
//                     height: 100, width: 100),
//               ],
//             ),
//           );
//         } else if (controller.statueRequest == StatueRequest.logicfaliure) {
//           return Center(
//             child: Column(
//               children: [
//                 Lottie.asset('lottie/Animation - 1710885863787.json'),
//               ],
//             ),
//           );
//         } else {
//           return ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) {
//                 return Text("${controller.data}");
//               });
//         }
//       }),
//     );
//   }
// }
