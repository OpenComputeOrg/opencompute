import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:client/core/design_system/theme_extension/app_theme_extension.dart';
import 'package:client/core/design_system/theme_extension/theme_manager.dart';



import 'package:client/app/app_flutter_bunny.dart';


/// Main App widget that configures the application using BLoC pattern.
class App extends StatelessWidget {
  /// Creates a new App instance.
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'client',
            debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: context.watch<ThemeCubit>().state.themeMode.toThemeMode(),

            home: const FlutterBunnyScreen(),
          );
        },
      ),
    );
  }
}



