class ItemModelJson {
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  bool? active;
  bool? isFavorite;
  int? price;
  Discount? discount;
  double? finalPrice;
  String? location;
  String? locationAr;
  String? locationLink;
  String? phone;
  List<String>? amenities;
  District? district;
  List<Gallery>? gallery;
  OpeningHours? openingHours;
  List<Courts>? courts;

  ItemModelJson(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.active,
      this.isFavorite,
      this.price,
      this.discount,
      this.finalPrice,
      this.location,
      this.locationAr,
      this.locationLink,
      this.phone,
      this.amenities,
      this.district,
      this.gallery,
      this.openingHours,
      this.courts});

  ItemModelJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
    description = json['description'];
    descriptionAr = json['descriptionAr'];
    active = json['active'];
    isFavorite = json['isFavorite'];
    price = json['price'];
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    finalPrice = json['finalPrice'].toDouble();
    location = json['location'];
    locationAr = json['locationAr'];
    locationLink = json['locationLink'];
    phone = json['phone'];
    amenities = json['amenities'].cast<String>();
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    openingHours = json['openingHours'] != null
        ? new OpeningHours.fromJson(json['openingHours'])
        : null;
    if (json['courts'] != null) {
      courts = <Courts>[];
      json['courts'].forEach((v) {
        courts!.add(new Courts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameAr'] = this.nameAr;
    data['description'] = this.description;
    data['descriptionAr'] = this.descriptionAr;
    data['active'] = this.active;
    data['isFavorite'] = this.isFavorite;
    data['price'] = this.price;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    data['finalPrice'] = this.finalPrice;
    data['location'] = this.location;
    data['locationAr'] = this.locationAr;
    data['locationLink'] = this.locationLink;
    data['phone'] = this.phone;
    data['amenities'] = this.amenities;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    if (this.openingHours != null) {
      data['openingHours'] = this.openingHours!.toJson();
    }
    if (this.courts != null) {
      data['courts'] = this.courts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Discount {
  String? type;
  double? value;
  String? expiresAt;

  Discount({this.type, this.value, this.expiresAt});

  Discount.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'].toDouble();
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}

class District {
  int? id;
  String? name;
  String? nameAr;

  District({this.id, this.name, this.nameAr});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameAr'] = this.nameAr;
    return data;
  }
}

class Gallery {
  String? image;

  Gallery({this.image});

  Gallery.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class OpeningHours {
  Friday? friday;
  Friday? monday;
  Friday? sunday;
  Friday? tuesday;
  Friday? saturday;
  Friday? thursday;
  Friday? wednesday;

  OpeningHours(
      {this.friday,
      this.monday,
      this.sunday,
      this.tuesday,
      this.saturday,
      this.thursday,
      this.wednesday});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    friday =
        json['Friday'] != null ? new Friday.fromJson(json['Friday']) : null;
    monday =
        json['Monday'] != null ? new Friday.fromJson(json['Monday']) : null;
    sunday =
        json['Sunday'] != null ? new Friday.fromJson(json['Sunday']) : null;
    tuesday =
        json['Tuesday'] != null ? new Friday.fromJson(json['Tuesday']) : null;
    saturday =
        json['Saturday'] != null ? new Friday.fromJson(json['Saturday']) : null;
    thursday =
        json['Thursday'] != null ? new Friday.fromJson(json['Thursday']) : null;
    wednesday = json['Wednesday'] != null
        ? new Friday.fromJson(json['Wednesday'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.friday != null) {
      data['Friday'] = this.friday!.toJson();
    }
    if (this.monday != null) {
      data['Monday'] = this.monday!.toJson();
    }
    if (this.sunday != null) {
      data['Sunday'] = this.sunday!.toJson();
    }
    if (this.tuesday != null) {
      data['Tuesday'] = this.tuesday!.toJson();
    }
    if (this.saturday != null) {
      data['Saturday'] = this.saturday!.toJson();
    }
    if (this.thursday != null) {
      data['Thursday'] = this.thursday!.toJson();
    }
    if (this.wednesday != null) {
      data['Wednesday'] = this.wednesday!.toJson();
    }
    return data;
  }
}

class Friday {
  String? to;
  String? from;

  Friday({this.to, this.from});

  Friday.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['from'] = this.from;
    return data;
  }
}

class Courts {
  int? id;
  String? name;

  Courts({this.id, this.name});

  Courts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
