import 'package:flutter/material.dart';
import 'package:flutter_components_poc/components/platform_dialog.dart';
import 'package:flutter_components_poc/screens/dialogs/dialogs.dart';
import 'package:flutter_components_poc/screens/testing/testing.dart';

enum TabItem { Testing, Dialogs }

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

  void setupDetachedScreen() => _DashboardState().detachedScreen();
}

class _DashboardState extends State<Dashboard> {
  TabItem selectedTab = TabItem.Testing;
  static BuildContext generalContext;

  @override
  Widget build(BuildContext context) {
    generalContext = context;

    return WillPopScope(
      onWillPop: () => _onBackPresssed(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Teste de Componentes"),
        ),
        body: buildContents(context),
        bottomNavigationBar: _buildNavigationBar(),
      ),
    );
  }

  Widget buildContents(BuildContext context) {
    switch (selectedTab) {
      case TabItem.Testing:
        return TestingPage();
        break;
      case TabItem.Dialogs:
        return DialogsPage();
        break;
    }

    return Container();
  }

  void detachedScreen() async {
    await PlatformDialog(
      title: "Teste Cancelado!",
      content: "Seu teste foi cancelado pelo app ter sido colocado em segundo plano",
      confirmText: "OK",
    ).show(generalContext);
  }

  Future<bool> _onBackPresssed(BuildContext context) async {
    print("Back button pressed");

    switch (selectedTab) {
      case TabItem.Testing:
        var runningState = TestingPage().getRunningState;

        if (runningState) {
          await PlatformDialog(
            title: "Teste em andamento!",
            content: "Por favor, cancele o teste antes sair.",
            confirmText: "OK",
          ).show(context);

          return false;
        }

        return true;
        break;
      case TabItem.Dialogs:
        _setSelectedTab(TabItem.Testing);
        return false;
        break;
    }

    return false;
  }

  void _updateTabItem(int index) {
    switch (index) {
      case 0:
        _setSelectedTab(TabItem.Testing);
        break;
      case 1:
        _setSelectedTab(TabItem.Dialogs);
        break;
    }
  }

  void _setSelectedTab(TabItem item) {
    setState(() {
      this.selectedTab = item;
    });
  }

  Widget _buildNavigationBar() {
    return BottomNavigationBar(
      items: [
        _buildItem(icon: Icons.radio_button_checked, title: "Testing"),
        _buildItem(icon: Icons.call_to_action, title: "Dialogs"),
      ],
      type: BottomNavigationBarType.fixed,
      onTap: _updateTabItem,
    );
  }

  BottomNavigationBarItem _buildItem({IconData icon, String title}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(title),
    );
  }
}
