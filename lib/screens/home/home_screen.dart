import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitlife/widgets/program_card.dart';
import 'package:fitlife/widgets/trainer_card.dart';
import 'package:fitlife/widgets/section_header.dart';
import 'package:fitlife/providers/app_providers.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredPrograms = ref.watch(featuredProgramsProvider);
    final featuredTrainers = ref.watch(featuredTrainersProvider);
    final userProfile = ref.watch(userProfileProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FitLife', style: TextStyle(fontWeight: FontWeight.bold)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Color(0xFF004D40)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.fitness_center, color: Colors.white, size: 48),
                      const SizedBox(height: 8),
                      Text(
                        'Transform Your Body,\nTransform Your Life',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, ${userProfile.name}!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ).animate().fadeIn().slideX(),
                  const SizedBox(height: 24),

                  // Quick Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionCard(context, Icons.play_circle_fill, 'Programs', () => context.go('/programs')),
                      _buildActionCard(context, Icons.people, 'Trainers', () => context.go('/trainers')),
                      _buildActionCard(context, Icons.card_membership, 'Membership', () => context.go('/membership')),
                      _buildActionCard(context, Icons.calendar_month, 'Schedule', () {}),
                    ],
                  ).animate().fadeIn(delay: 200.ms).slideY(),
                  const SizedBox(height: 32),

                  // Featured Programs
                  SectionHeader(
                    title: 'Featured Programs',
                    onSeeAll: () => context.go('/programs'),
                  ),
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredPrograms.length,
                      itemBuilder: (context, index) {
                        return ProgramCard(
                          program: featuredPrograms[index],
                          onTap: () => context.push('/program/${featuredPrograms[index].id}'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Top Trainers
                  SectionHeader(
                    title: 'Top Trainers',
                    onSeeAll: () => context.go('/trainers'),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredTrainers.length,
                      itemBuilder: (context, index) {
                        return TrainerCard(
                          trainer: featuredTrainers[index],
                          onTap: () => context.push('/trainer/${featuredTrainers[index].id}'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Your Membership
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.stars, size: 40, color: Theme.of(context).colorScheme.primary),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current Plan',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Text(
                                    userProfile.membershipType,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => context.go('/membership'),
                              child: const Text('Upgrade'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.onSecondaryContainer, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
