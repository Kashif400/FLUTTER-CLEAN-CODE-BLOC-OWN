import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/dependency_injection.dart';
import 'core/utils/talker_bloc_observer.dart';
import 'core/utils/talker_service.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print('Warning: Could not load .env file: $e');
  }

  // Initialize dependencies for test environment
  await initializeDependencies(environment: 'test');

  // Get TalkerService and setup BLoC observer
  final talkerService = locator<TalkerService>();
  Bloc.observer = TalkerBlocObserverService(talkerService);

  talkerService.info('🧪 Starting app in TEST mode');

  runApp(const AppWidget());
}
