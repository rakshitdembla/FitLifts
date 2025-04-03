class GalleryModel {
  final int? id;
  final String imagePath;
  final DateTime date;
  final double? bodyWeight;
  final int? ratePump;

  GalleryModel({
    
     this.id,
    required this.imagePath,
    required this.date,
    this.bodyWeight,
    this.ratePump,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image_path': imagePath,
      'date': date.toIso8601String(),
      'body_weight': bodyWeight,
      'rate_pump': ratePump,
    };
  }

  factory GalleryModel.fromMap(Map<String, dynamic> map) {
    return GalleryModel(
      id: map['id'],
      imagePath: map['image_path'],
      date: DateTime.parse(map['date']),
      bodyWeight: map['body_weight'],
      ratePump: map['rate_pump'],
    );
  }
}
