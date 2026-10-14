import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitlife/widgets/program_card.dart';
import 'package:fitlife/providers/app_providers.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProgramsScreen extends ConsumerStatefulWidget {
  const ProgramsScreen({super.key});

  @override
  ConsumerState<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends ConsumerState<ProgramsScreen> {
  String selectedCategory = 'All';

  final List<String> categories = ['All', 'Strength', 'Cardio', 'Flexibility', 'Dance', 'Water Sports'];

  @override
  Widget build(BuildContext context) {
    final allPrograms = ref.watch(programsProvider);
    final programs = selectedCategory == 'All'
      ? allPrograms
        : allPrograms.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      }
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: programs.length,
              itemBuilder: (context, index) {
                return ProgramCard(
                  program: programs[index],
                  isHorizontal: false,
                  onTap: () => context.push('/program/${programs[index].id}'),
                ).animate().fadeIn(delay: (index * 100).ms).slideY(begin: 0.2, end: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
