class UserProfile {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String membershipType;
  final DateTime memberSince;
  final List<String> bookings;
  final bool isActive;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.membershipType,
    required this.memberSince,
    required this.bookings,
    required this.isActive,
  });

  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    String? membershipType,
    DateTime? memberSince,
    List<String>? bookings,
    bool? isActive,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      membershipType: membershipType ?? this.membershipType,
      memberSince: memberSince ?? this.memberSince,
      bookings: bookings ?? this.bookings,
      isActive: isActive ?? this.isActive,
    );
  }
}
