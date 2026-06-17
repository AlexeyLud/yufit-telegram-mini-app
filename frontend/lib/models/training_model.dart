class TrainingModel {
  final int id;
  final String title;
  final int categoryId;
  final int price;
  final String duration;
  final String difficulty;
  final String image;
  final String description;
  final int lessons;
  final double rating;

  TrainingModel({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.price,
    required this.duration,
    required this.difficulty,
    required this.image,
    required this.description,
    required this.lessons,
    required this.rating,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      id: json['id'],
      title: json['title'],
      categoryId: json['category_id'],
      price: json['price'],
      duration: json['duration'],
      difficulty: json['difficulty'],
      image: json['image'],
      description: json['description'],
      lessons: json['lessons'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
