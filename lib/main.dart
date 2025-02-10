import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamic_ui_app/bloc/homepage_bloc.dart';
import 'package:dynamic_ui_app/screens/homepage_screen.dart';
import 'package:dynamic_ui_app/api/service_locator.dart';

void main() {
  // Initialize Dependency Injection
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<HomepageBloc>()..add(FetchHomepageData()),
        child: HomepageScreen(),
      ),
    );
  }
}
