import 'package:flutter/material.dart';
import 'package:flutter_first_app/presentation/screens/counters/counter_functions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.greenAccent,
        brightness: Brightness.dark,
      ),
      home: const CounterFunctionsScreenWidget(),
    );
  }
}
