class UpcomingModel {
  final String? placeName;
  final String? placeNameAr;
  final String? courtName;
  final String? from;
  final String? to;
  final String? status;
  final double? amount;
  final String? date;

  UpcomingModel(
      {this.placeName,
      this.placeNameAr,
      this.courtName,
      this.from,
      this.to,
      this.status,
      this.amount,
      this.date});

  factory UpcomingModel.fromJson(Map<String, dynamic> json) {
    return UpcomingModel(
      placeName: json['placeName'],
      placeNameAr: json['placeNameAr'],
      courtName: json['courtName'],
      from: json['from'],
      to: json['to'],
      status: json['status'],
      amount: json['amount'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeName': placeName,
      'placeNameAr': placeNameAr,
      'courtName': courtName,
      'from': from,
      'to': to,
      'status': status,
      'amount': amount,
      'date': date,
    };
  }
}
