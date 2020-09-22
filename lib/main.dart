import 'package:flutter/material.dart';
import 'package:flutter_components_poc/screens/dashboard.dart';

void main() {
  runApp(ComponentsApp());
}

class ComponentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Dashboard(),
    );
  }
}