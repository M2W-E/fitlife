import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/program.dart';
import '../models/trainer.dart';
import '../models/membership.dart';
import '../models/user_profile.dart';
import '../data/mock_data.dart';

final programsProvider = Provider<List<Program>>((ref) {
  return MockData.programs;
});

final trainersProvider = Provider<List<Trainer>>((ref) {
  return MockData.trainers;
});

final membershipsProvider = Provider<List<Membership>>((ref) {
  return MockData.memberships;
});

class UserProfileNotifier extends StateNotifier<UserProfile> {
  UserProfileNotifier() : super(MockData.currentUser);

  void updateProfile(UserProfile newProfile) {
    state = newProfile;
  }
}

final userProfileProvider = StateNotifierProvider<UserProfileNotifier, UserProfile>((ref) {
  return UserProfileNotifier();
});

final selectedMembershipProvider = StateProvider<String?>((ref) {
  return null;
});

final featuredProgramsProvider = Provider<List<Program>>((ref) {
  final programs = ref.watch(programsProvider);
  return programs.take(4).toList();
});

final featuredTrainersProvider = Provider<List<Trainer>>((ref) {
  final trainers = ref.watch(trainersProvider);
  return trainers.take(3).toList();
});
