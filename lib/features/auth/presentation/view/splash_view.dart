import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  Future<void> _navigateToOnboarding() async {
    // Wait for 4 seconds
    await Future.delayed(const Duration(seconds: 4));

    context.go(AppRoutes.onBoardView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'assets/logos/app_icon.png',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.flutter_dash, size: 150, color: Colors.white);
              },
            ),
            const SizedBox(height: 30),
            // App Name or Loading Indicator
            const Text(
              'Clean Code Architecture',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // Loading Indicator
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
