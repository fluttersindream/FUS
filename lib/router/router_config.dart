import 'package:FUS/page/home_pege.dart';
import 'package:FUS/page/commom/not_find_page.dart';
import 'package:FUS/router/engineering_service_router.dart';
import 'package:FUS/router/study_router.dart';
import 'package:flutter/material.dart';

import 'flutter_widget_router.dart';

/// Author: Asscre
/// Editing time: 2020/8/26
///
class RouterConfig {
  static Map<String, Function> routes = {
    "/": (context) => HomePage(),
  };

  void initRouters() {
    routes.addAll(engineeringServiceRouter);
    routes.addAll(studyRouter);
    routes.addAll(flutterWidgetRouter);
  }

  static toPage(BuildContext context, String routeName, {dynamic arguments}) {
    if (RouterConfig.routes[routeName] == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => NotFindPage()),
      );
    } else {
      if (arguments == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: RouterConfig.routes[routeName](),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: RouterConfig.routes[routeName](arguments),
          ),
        );
      }
    }
  }

  static Future toCBPage(BuildContext context, String routeName, {dynamic arguments}) async {
    var cbData;
    if (RouterConfig.routes[routeName] == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => NotFindPage()),
      );
    } else {
      if (arguments == null) {
        cbData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: RouterConfig.routes[routeName](),
          ),
        );
      } else {
        cbData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: RouterConfig.routes[routeName](arguments),
          ),
        );
      }
    }
    return cbData;
  }
}
