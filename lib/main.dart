import 'package:flutter/material.dart';
import 'package:map_test/presentation/home_screen.dart';

void main() {
  runApp(const FluterMap());
}

class FluterMap extends StatelessWidget {
  const FluterMap({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}