import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitlife/widgets/membership_card.dart';
import 'package:fitlife/providers/app_providers.dart';

class MembershipScreen extends ConsumerStatefulWidget {
  const MembershipScreen({super.key});

  @override
  ConsumerState<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends ConsumerState<MembershipScreen> {
  bool isYearly = false;
  String? selectedPlanId;

  @override
  Widget build(BuildContext context) {
    final memberships = ref.watch(membershipsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Plans'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildToggleButton('Monthly', !isYearly),
                  _buildToggleButton('Yearly', isYearly),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ...memberships.map((membership) => MembershipCard(
                  membership: membership,
                  isYearly: isYearly,
                  onSelect: () {
                    setState(() {
                      selectedPlanId = membership.id;
                    });
                  },
                )),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text('Compare Plans', style: TextStyle(decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isYearly = text == 'Yearly';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
