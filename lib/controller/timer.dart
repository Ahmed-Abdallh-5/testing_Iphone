import 'package:get/get.dart';

class Timerr extends GetxController {
  List<Map<String, int>> selectedTimes = [];
  void addTime(int hour, int minute) {
    selectedTimes.add({'hour': hour, 'minute': minute});
  }

  int? chosenhours;
  int? chosenmin;
}
