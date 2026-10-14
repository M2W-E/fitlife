import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitlife/models/trainer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TrainerCard extends StatelessWidget {
  final Trainer trainer;
  final VoidCallback onTap;

  const TrainerCard({
    super.key,
    required this.trainer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 188,
        margin: const EdgeInsets.only(right: 16, bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: 'trainer-${trainer.id}',
                child: CircleAvatar(
                  radius: 34,
                  backgroundImage: CachedNetworkImageProvider(trainer.imageUrl),
                  backgroundColor: Colors.grey[200],
                  onBackgroundImageError: (_, __) {},
                  child: trainer.imageUrl.isEmpty ? const Icon(Icons.person, size: 34, color: Colors.grey) : null,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                trainer.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                trainer.specialty,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontSize: 11),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    trainer.rating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                '${trainer.yearsExperience} yrs exp',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
      ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0),
    );
  }
}
