// To parse this JSON data, do
//
//     final prodectModel = prodectModelFromJson(jsonString);

List<ProdectsModel> prodectModelFromJson(str) =>
    List<ProdectsModel>.from(str.map((x) => ProdectsModel.fromJson(x)));

class ProdectsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProdectsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProdectsModel.fromJson(Map<String, dynamic> json) => ProdectsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );
}
