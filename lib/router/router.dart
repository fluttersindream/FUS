import 'package:FUS/page/home_pege.dart';
import 'package:FUS/page/not_find_page.dart';
import 'package:FUS/router/engineering_service_router.dart';
import 'package:flutter/material.dart';

/// Author: Asscre
/// Editing time: 2020/8/26
///
class Router {
  static Map<String, Function> routes = {
    "/": (context) => HomePage(),
  };

  void initRouters() {
    routes.addAll(engineeringServiceRouter);
  }


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    print(settings.name);

    final String name = settings.name;
    final Function buildCtx = routes[name];

    if (buildCtx == null) {
      return MaterialPageRoute(builder: (_) => NotFindPage());
    } else {
      if (settings.arguments == null) {
        return MaterialPageRoute(builder: buildCtx()());
      } else {
        return MaterialPageRoute(builder: buildCtx(settings.arguments));
      }
    }
  }
}

