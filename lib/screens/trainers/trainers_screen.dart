import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitlife/widgets/trainer_card.dart';
import 'package:fitlife/providers/app_providers.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TrainersScreen extends ConsumerWidget {
  const TrainersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainers = ref.watch(trainersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Trainers'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: TrainerCard(
              trainer: trainers[index],
              onTap: () => context.push('/trainer/${trainers[index].id}'),
            ),
          ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.1, end: 0);
        },
      ),
    );
  }
}
