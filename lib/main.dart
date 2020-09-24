import 'package:flutter/material.dart';
import 'package:flutter_components_poc/screens/dashboard/dashboard.dart';
import 'package:flutter_components_poc/screens/lifecycle_manager.dart';

void main() {
  runApp(ComponentsApp());
}

class ComponentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: MaterialApp(
        theme: ThemeData.light(),
        home: Dashboard(),
      ),
    );
  }
}
