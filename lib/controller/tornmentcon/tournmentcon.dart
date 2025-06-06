import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/tournment/tournament.dart';
import 'package:ecommerce/data/model/tournmentmodel.dart';
import 'package:get/get.dart';

abstract class TournmentCon extends GetxController {
  Getdata();
  jointournament(int tournamentid);
}

class Tournmentconimble extends TournmentCon {
  TournmentModel? tournmentModel;
  StatueRequest? statueRequest;
  late List tournament = [];
  GetTournment getTournment = GetTournment(Get.find());
  @override
  Getdata() async {
    statueRequest = StatueRequest.loading;
    update(); // Notify UI of loading state

    var response = await getTournment.Getmymatches();
    statueRequest = handlingdata(response);

    if (statueRequest == StatueRequest.Success) {
      tournament.clear();

      tournament.addAll(response['data']);
      print(tournament.length);
      update();
    } else if (statueRequest == StatueRequest.offline) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "308".tr,
      );
    } else if (statueRequest == StatueRequest.ServerFaliure) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "307".tr,
      );
    }

    update(); // Ensure UI reflects the final state
  }

  gototournamentdetailscreen(TournmentModel tournmentModel) {
    Get.toNamed("/tornamentDetailsScreen",
        arguments: {"tournament": tournmentModel});
  }

  jointournament(int tournamentid) async {
    statueRequest = StatueRequest.loading;
    update(); // Notify UI of loading state

    var response = await getTournment.jointournament(tournamentid);
    statueRequest = handlingdata(response);

    if (statueRequest == StatueRequest.Success) {
      Get.defaultDialog(
        title: "352".tr,
        middleText: "351".tr,
      );
      await Getdata();
      update();
    } else if (statueRequest == StatueRequest.offline) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "308".tr,
      );
    } else if (statueRequest == StatueRequest.unauthenticated) {
      Get.offAllNamed("/loginsceen");
    } else if (statueRequest == StatueRequest.joinedbefore) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "353".tr,
      );
    } else if (statueRequest == StatueRequest.ServerFaliure) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "307".tr,
      );
    }

    update(); // Ensure UI reflects the final state
  }

  @override
  void onInit() {
    Getdata();
    super.onInit();
  }
}
