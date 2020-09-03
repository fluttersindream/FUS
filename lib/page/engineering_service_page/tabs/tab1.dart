import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  Tab1(this.param);
  final String param;
  @override
  Widget build(BuildContext context) {
    print(param);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("APPS"),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("MOVIES"),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("GAMES"),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ],
        ),
      ),
    );
  }
}
