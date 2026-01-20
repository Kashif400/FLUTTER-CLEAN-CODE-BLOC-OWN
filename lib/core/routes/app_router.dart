import 'package:clean_code_architecture_app/features/auth/presentation/view/onboarding_view.dart';
import 'package:clean_code_architecture_app/features/auth/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'custom_page_builder_widget.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

class AppRouter {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splashView,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.splashView,
        pageBuilder: (context, state) =>
            customPageBuilderWidget(context, state, const SplashView()),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.onBoardView,
        pageBuilder: (context, state) =>
            customPageBuilderWidget(context, state, const OnboardingView()),
      ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutes.frontDeskView,
      //   pageBuilder: (context, state) =>
      //       customPageBuilderWidget(context, state, const SignInView()),
      // ),
    ],
  );
}
