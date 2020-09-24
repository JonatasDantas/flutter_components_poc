import 'package:flutter/material.dart';
import 'package:flutter_components_poc/components/platform_button.dart';

class TestingPage extends StatefulWidget {
  static _TestingPageState generalState;

  @override
  _TestingPageState createState() {
    generalState = _TestingPageState();
    return generalState;
  }

  bool get getRunningState => _TestingPageState.runningState;
}

class _TestingPageState extends State<TestingPage> {
  static bool runningState = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlatformButton(
            child: Text(
              !runningState ? "Executar estado de teste" : "Parar Teste",
              style: TextStyle(color: Colors.white),
            ),
            color: !runningState ? Colors.blue[300] : Colors.red[600],
            onPressed: () => setRunningState(!runningState),
          )
        ],
      ),
    );
  }

  void setRunningState(bool value) {
    setState(() {
      runningState = value;
    });
  }
}
