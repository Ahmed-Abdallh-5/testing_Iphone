class MyFavouriteModel {
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  int? discount;
  int? price;
  String? location;
  String? locationLink;
  String? phone;
  Null? createdAt;
  Category? category;
  List<Images>? images;
  bool? favorite;
  String? rating;

  MyFavouriteModel(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.discount,
      this.price,
      this.location,
      this.locationLink,
      this.phone,
      this.createdAt,
      this.category,
      this.images,
      this.favorite,
      this.rating});

  MyFavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
    description = json['description'];
    descriptionAr = json['descriptionAr'];
    discount = json['discount'];
    price = json['price'];
    location = json['location'];
    locationLink = json['location_link'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    favorite = json['favorite'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameAr'] = this.nameAr;
    data['description'] = this.description;
    data['descriptionAr'] = this.descriptionAr;
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['location'] = this.location;
    data['location_link'] = this.locationLink;
    data['phone'] = this.phone;
    data['createdAt'] = this.createdAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['favorite'] = this.favorite;
    data['rating'] = this.rating;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? nameAr;

  Category({this.id, this.name, this.nameAr});

  Category.fromJson(Map<String, dynamic> json) {
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

class Images {
  String? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}
