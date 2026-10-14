class Program {
  final String id;
  final String name;
  final String description;
  final String longDescription;
  final String imageUrl;
  final String duration;
  final String intensity;
  final String category;
  final List<String> benefits;
  final String schedule;
  final double rating;
  final int enrolledCount;

  const Program({
    required this.id,
    required this.name,
    required this.description,
    required this.longDescription,
    required this.imageUrl,
    required this.duration,
    required this.intensity,
    required this.category,
    required this.benefits,
    required this.schedule,
    required this.rating,
    required this.enrolledCount,
  });

  Program copyWith({
    String? id,
    String? name,
    String? description,
    String? longDescription,
    String? imageUrl,
    String? duration,
    String? intensity,
    String? category,
    List<String>? benefits,
    String? schedule,
    double? rating,
    int? enrolledCount,
  }) {
    return Program(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      longDescription: longDescription ?? this.longDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      duration: duration ?? this.duration,
      intensity: intensity ?? this.intensity,
      category: category ?? this.category,
      benefits: benefits ?? this.benefits,
      schedule: schedule ?? this.schedule,
      rating: rating ?? this.rating,
      enrolledCount: enrolledCount ?? this.enrolledCount,
    );
  }

  @override
  String toString() {
    return 'Program(id: $id, name: $name, category: $category, rating: $rating)';
  }
}
