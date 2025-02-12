class TournmentModel {
  int? id;
  String? title;
  String? level;
  String? date;
  int? playersLimit;
  int? playersLeft;
  Prizes? prizes;
  int? fee;
  int? placeId;
  String? placeAr;
  String? placeEn;

  TournmentModel(
      {this.id,
      this.title,
      this.level,
      this.date,
      this.playersLimit,
      this.playersLeft,
      this.prizes,
      this.fee,
      this.placeId,
      this.placeAr,
      this.placeEn});

  TournmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    level = json['level'];
    date = json['date'];
    playersLimit = json['playersLimit'];
    playersLeft = json['playersLeft'];
    prizes =
        json['prizes'] != null ? new Prizes.fromJson(json['prizes']) : null;
    fee = json['fee'];
    placeId = json['place_id'];
    placeAr = json['placeAr'];
    placeEn = json['placeEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['level'] = this.level;
    data['date'] = this.date;
    data['playersLimit'] = this.playersLimit;
    data['playersLeft'] = this.playersLeft;
    if (this.prizes != null) {
      data['prizes'] = this.prizes!.toJson();
    }
    data['fee'] = this.fee;
    data['place_id'] = this.placeId;
    data['placeAr'] = this.placeAr;
    data['placeEn'] = this.placeEn;
    return data;
  }
}

class Prizes {
  int? i1st;
  int? i2nd;
  int? i3rd;

  Prizes({this.i1st, this.i2nd, this.i3rd});

  Prizes.fromJson(Map<String, dynamic> json) {
    i1st = json['1st'];
    i2nd = json['2nd'];
    i3rd = json['3rd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1st'] = this.i1st;
    data['2nd'] = this.i2nd;
    data['3rd'] = this.i3rd;
    return data;
  }
}
