class RecipeModel {
  final int id, categoryId;
  final num rating, timeRequired;
  final String title, description, photo;

  RecipeModel({
    required this.id,
    required this.categoryId,
    required this.rating,
    required this.timeRequired,
    required this.title,
    required this.description,
    required this.photo,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      rating: json['rating'],
      timeRequired: json['timeRequired'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
    );
  }
}
