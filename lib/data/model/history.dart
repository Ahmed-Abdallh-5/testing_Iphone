class HistoryModel {
  String? placeName;
  String? placeNameAr;
  String? courtName;
  String? from;
  String? to;
  String? status;
  double? amount;
  String? date;

  HistoryModel(
      {this.placeName,
      this.placeNameAr,
      this.courtName,
      this.from,
      this.to,
      this.status,
      this.amount,
      this.date});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    placeName = json['placeName'];
    placeNameAr = json['placeNameAr'];
    courtName = json['courtName'];
    from = json['from'];
    to = json['to'];
    status = json['status'];
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeName'] = this.placeName;
    data['placeNameAr'] = this.placeNameAr;
    data['courtName'] = this.courtName;
    data['from'] = this.from;
    data['to'] = this.to;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['date'] = this.date;
    return data;
  }
}
