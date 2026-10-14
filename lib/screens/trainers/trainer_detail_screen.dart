import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitlife/providers/app_providers.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TrainerDetailScreen extends ConsumerWidget {
  final String trainerId;

  const TrainerDetailScreen({super.key, required this.trainerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainers = ref.watch(trainersProvider);
    final trainer = trainers.firstWhere((t) => t.id == trainerId);

    return Scaffold(
      appBar: AppBar(
        title: Text(trainer.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'trainer-${trainer.id}',
              child: CircleAvatar(
                radius: 60,
                backgroundImage: CachedNetworkImageProvider(trainer.imageUrl),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              trainer.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ).animate().fadeIn().slideY(),
            const SizedBox(height: 4),
            Text(
              trainer.specialty,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '${trainer.rating} Rating',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 24),
                const Icon(Icons.work_history, color: Colors.blue),
                const SizedBox(width: 4),
                Text(
                  '${trainer.yearsExperience} Years Exp.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.email, color: Colors.grey),
                  onPressed: () {},
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.phone, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            const Divider(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              trainer.bio,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Certifications',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: trainer.certifications.map((cert) => Chip(
                label: Text(cert),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              )).toList(),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Available Sessions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ...trainer.availableSessions.map((session) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(session),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            )),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: const Text('Book Session', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
