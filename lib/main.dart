import 'package:flutter/material.dart';

import 'router/router.dart';
import 'page/index_page.dart';

/// Author: Asscre
/// Editing time: 2020/8/26
void main() {
  Router router = Router();
  router.initRouters();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter学习先驱',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router.onGenerateRoute,
      home: IndexPage(),
    );
  }
}
