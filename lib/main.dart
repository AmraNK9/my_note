import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/business_logic/bloc/task_bloc.dart';
import 'package:my_note/pages/main_page.dart';

import 'package:my_note/routes/route_generator.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => TaskBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        home: const MainPage());
  }
}
