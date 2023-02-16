class ApiModel {
  String? title;
  int? id;
  String? image;
  String? description;
  var price;
  String? category;
  ApiModel(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.category});

  factory ApiModel.fromJson(Map<String, dynamic> data) {
    return ApiModel(
        id: data["id"],
        image: data["image"],
        title: data['title'],
        description: data["description"],
        category: data["category"],
        price: data['price']);
  }

//mapping in json format
  Map<String, dynamic> tojson() {
    return {
      "image": image,
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
    };
  }
}
