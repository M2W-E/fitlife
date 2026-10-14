import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitlife/theme/app_theme.dart';
import 'package:fitlife/router/app_router.dart';

void main() {
  runApp(
    // Wrap app with ProviderScope for Riverpod state management
    const ProviderScope(
      child: FitLifeApp(),
    ),
  );
}

/// Main Application Entry Point
class FitLifeApp extends ConsumerWidget {
  const FitLifeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router provider for navigation changes
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'FitLife',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Supports both light & dark modes based on system settings
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
