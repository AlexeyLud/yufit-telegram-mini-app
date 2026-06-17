class MaterialModel {
  final int id;
  final String title;
  final String type;
  final int categoryId;
  final int price;
  final double rating;
  final String? size;
  final int? pages;
  final String? duration;

  MaterialModel({
    required this.id,
    required this.title,
    required this.type,
    required this.categoryId,
    required this.price,
    required this.rating,
    this.size,
    this.pages,
    this.duration,
  });

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      categoryId: json['category_id'],
      price: json['price'],
      rating: (json['rating'] as num).toDouble(),
      size: json['size'],
      pages: json['pages'],
      duration: json['duration'],
    );
  }
}
