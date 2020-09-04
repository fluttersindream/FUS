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

  static toPage(BuildContext context, String routeName, {dynamic arguments}) {
    if (Router.routes[routeName] == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => NotFindPage()),
      );
    } else {
      if (arguments == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: Router.routes[routeName](),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: Router.routes[routeName](arguments),
          ),
        );
      }
    }
  }

  static Future toCBPage(BuildContext context, String routeName, {dynamic arguments}) async {
    var cbData;
    if (Router.routes[routeName] == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => NotFindPage()),
      );
    } else {
      if (arguments == null) {
        cbData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: Router.routes[routeName](),
          ),
        );
      } else {
        cbData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: Router.routes[routeName](arguments),
          ),
        );
      }
    }
    return cbData;
  }
}
