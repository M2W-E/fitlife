class Trainer {
  final String id;
  final String name;
  final String specialty;
  final String bio;
  final String imageUrl;
  final int yearsExperience;
  final double rating;
  final int clientCount;
  final List<String> certifications;
  final List<String> specialties;
  final List<String> availableSessions;
  final String email;
  final String phone;

  const Trainer({
    required this.id,
    required this.name,
    required this.specialty,
    required this.bio,
    required this.imageUrl,
    required this.yearsExperience,
    required this.rating,
    required this.clientCount,
    required this.certifications,
    required this.specialties,
    required this.availableSessions,
    required this.email,
    required this.phone,
  });
}
