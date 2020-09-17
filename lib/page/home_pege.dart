import 'package:FUS/config/style.dart';
import 'package:FUS/page/study_page/study_page.dart';
import 'package:FUS/pubs/screen_util.dart';
import 'package:flutter/material.dart';

import 'engineering_service_page/engineering_service_page.dart';
import 'mine/mine_page.dart';

/// Author: Asscre
/// Editing time: 2020/8/26
///
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList;

  List<BottomNavigationBarItem> navBar;

  // 当前被选中的 tab 页的下标
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    pageList = [
      StudyPage(),
      EngineeringServicePage(),
      MinePage(),
    ];

    navBar = [
      BottomNavigationBarItem(
        icon: Icon(
          IconData(0xe603, fontFamily: 'iconfont'),
          size: sp(48),
        ),
        title: Text(''),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          IconData(0xe602, fontFamily: 'iconfont'),
          size: sp(48),
        ),
        title: Text(''),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          IconData(0xe604, fontFamily: 'iconfont'),
          size: sp(48),
        ),
        title: Text(''),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Style.black,
        unselectedItemColor: Style.grey,
        backgroundColor: Style.white,
        currentIndex: currentIndex,
        elevation: 0,
        items: navBar,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pageList,
      ),
    );
  }
}
