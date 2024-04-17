import 'package:axolor_mobile/src/core/contants/global_constants.dart';
import 'package:axolor_mobile/src/core/di/dependency_injector.dart';
import 'package:axolor_mobile/src/core/environments/environments.dart';
import 'package:axolor_mobile/src/core/routing/router.dart';
import 'package:axolor_mobile/src/core/utils/services/bloc_observer_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

void main() async {
  // Load Dotenv file
  await dotenv.load(fileName: ".env");

  // Set Environmental variables
  EnvironmentsImpl().devEnvironment();

  // Logging in debug mode
  if (kDebugMode) {
    Bloc.observer = BlocObserverService();
  }

  // Get Environmental variables
  final environments = EnvironmentsImpl();

  // Configure dependencies
  configureDependencies();

  // Run App
  runApp(MyApp(debugMode: environments.debugMode));
}

class MyApp extends StatelessWidget {
  final bool debugMode;

  const MyApp({super.key, required this.debugMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalConstants.appName,
      debugShowCheckedModeBanner: debugMode,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/launch-pad',
    );
  }
}
