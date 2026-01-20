import 'package:clean_code_architecture_app/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';

import '../config/routes/app_router.dart';
import '../l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
