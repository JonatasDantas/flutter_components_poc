import 'package:flutter/material.dart';
import 'package:flutter_components_poc/screens/dashboard/dashboard.dart';
import 'package:flutter_components_poc/screens/testing/testing.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;

  LifeCycleManager({Key key, this.child}) : super(key: key);

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    print("started initState");
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print("started dispose");
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    print("changed to state: $state");

    switch (state) {      
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        var runningState = TestingPage().getRunningState;

        if (runningState) {
          print("entrou runnning state");
          Dashboard().setupDetachedScreen();
          TestingPage.generalState.setRunningState(false);
        }
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
}