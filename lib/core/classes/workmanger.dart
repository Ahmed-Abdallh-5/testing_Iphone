// import 'package:ecommerce/core/classes/notfications.dart';
// import 'package:workmanager/workmanager.dart';

// class WorkMangerClass {
//   Future<void> intialmanger() async {
//     await Workmanager().initialize(
//         actionfunction, // The top level function, aka callbackDispatcher
//         isInDebugMode:
//             false // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
//         );

//     registertask();
//   }

//   Future<void> cancelAll(String uniqueName) async {
//     try {
//       await Workmanager().cancelByUniqueName(uniqueName);
//       print('Task canceled successfully: $uniqueName');
//     } catch (error) {
//       print('Error canceling task: $error');
//     }
//   }
// }

// registertask() async {
//   await Workmanager().registerPeriodicTask("id1", "notfications",
//       frequency: Duration(minutes: 1));
// }

// @pragma('vm:entry-point')
// void actionfunction() async {
//   Workmanager().executeTask((taskName, inputData) async {
//     try {
//       // Notfications().Showbasicnotfication();
//       // await Notfications().Showbasicnotfication();
//       // Timerr timer = Get.put(Timerr());
//       // List<Map<String, dynamic>> selectedTimes = [
//       //   {
//       //     'id': "1",
//       //     'year': 2024,
//       //     'month': 12,
//       //     'day': 1,
//       //     'hour': 00,
//       //     'minute': 18
//       //   },
//       //   {
//       //     'id': "2",
//       //     'year': 2024,
//       //     'month': 12,
//       //     'day': 1,
//       //     'hour': 00,
//       //     'minute': 19
//       //   }
//       // ];

//       // await Notfications().Remindmenotication("id12", 2024, 12, 1, 00, 22);

//       // await Notfications().ShowRepetednotfication();
//       await Notfications().ShowSchedulenotficationMorning();
//       await Notfications().ShowSchedulenotficationMidday();
//       await Notfications().ShowSchedulenotficationNight();
//     } catch (error) {
//       // Handle the error here, e.g., log it or retry the task
//       print("Error showing notification: $error");
//     }
//     return Future.value(true);
//   });
// }
