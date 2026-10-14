import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:fitlife/screens/home/home_screen.dart';
import 'package:fitlife/screens/programs/programs_screen.dart';
import 'package:fitlife/screens/programs/program_detail_screen.dart';
import 'package:fitlife/screens/trainers/trainers_screen.dart';
import 'package:fitlife/screens/trainers/trainer_detail_screen.dart';
import 'package:fitlife/screens/membership/membership_screen.dart';
import 'package:fitlife/screens/profile/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorProgramsKey = GlobalKey<NavigatorState>(debugLabel: 'programs');
final _shellNavigatorTrainersKey = GlobalKey<NavigatorState>(debugLabel: 'trainers');
final _shellNavigatorMembershipKey = GlobalKey<NavigatorState>(debugLabel: 'membership');
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

/// Riverpod provider for GoRouter configuration
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigationBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProgramsKey,
            routes: [
              GoRoute(
                path: '/programs',
                builder: (context, state) => const ProgramsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorTrainersKey,
            routes: [
              GoRoute(
                path: '/trainers',
                builder: (context, state) => const TrainersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMembershipKey,
            routes: [
              GoRoute(
                path: '/membership',
                builder: (context, state) => const MembershipScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      // Standalone routes outside of bottom navigation
      GoRoute(
        path: '/program/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProgramDetailScreen(programId: id); // Assuming it takes a programId
        },
      ),
      GoRoute(
        path: '/trainer/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return TrainerDetailScreen(trainerId: id); // Assuming it takes a trainerId
        },
      ),
    ],
  );
});

/// A scaffold that wraps the StatefulNavigationShell to display a Material 3 NavigationBar
class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (int index) {
          // Navigate to the branch, supporting returning to the initial location when tapped again
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center),
            label: 'Programs',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outlined),
            selectedIcon: Icon(Icons.people),
            label: 'Trainers',
          ),
          NavigationDestination(
            icon: Icon(Icons.card_membership_outlined),
            selectedIcon: Icon(Icons.card_membership),
            label: 'Membership',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
