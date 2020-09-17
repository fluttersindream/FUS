import 'package:FUS/config/style.dart';
import 'package:FUS/pubs/provider_widget.dart';
import 'package:FUS/widget/appbar_widget.dart';
import 'package:FUS/widget/explain_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Author: Asscre
/// Editing time: 2020/8/26
/// 本页面说明使用Provider的一种方式
/// ```dart
///  class Page extends StatelessWidget {
///    @override
///    Widget build(BuildContext context) {
///      return ProviderWidget<T>(
///        model: T(),
///        builder: (BuildContext context, Widget child) {
///        ``` ```
///        },
///      );
///    }
///  }
/// ```
/// 调用Provider实例中的参数方法: context.watch<T>().paramsName
/// 调用Provider实例中的函数方法: context.read<T>().funcName()
///
/// 本示例中实现一次挂载，多处调用的方式构建
/// 优点：一次挂载在context中，子类可以通过context获取到
/// 缺点：与原生Flutter setState一样，通知页面更新时，遍历context，所有Provider包裹下的
///      Widget都被触发build，追求最少代码快速开发，无法精准控制Widget刷新，耗费性能
///
/// 本方法适用于简单的页面展示，如菜单详情、列表展示、物品详情等
/// 不适用于对性能有高性能追求的页面，如：批量动画展示、快速构建视图等
class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print('page build');
    return ProviderWidget<ProviderProvider>(
      model: ProviderProvider(),
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBarWidget('Provider使用', context),
          body: ListView(
            children: <Widget>[
              _tip(),
              _count(context),
              _explain(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<ProviderProvider>().add(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
            backgroundColor: Style.orange,
          ),
        );
      },
    );
  }

  Widget _tip() {
    print('_tip,你看我刷新没有！');
    return Center(
      child: Text(
        '你看我会增加哦！',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _count(BuildContext context) {
    print('_count,你看我刷新没有！');
    return Center(
      child: Text(
        context.watch<ProviderProvider>().count.toString(),
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget _explain() {
    return ExplainWidget(
      '本页面说明使用Provider的一种方式\n'
          'class Page extends StatelessWidget {\n'
          '   @override\n'
          '      Widget build(BuildContext context) {\n'
          '        return ProviderWidget<T>(\n'
          '           model: T(),\n'
          '             builder: (BuildContext context, Widget child) {\n'
          '                ``` ```\n'
          '        },\n'
          '      );\n'
          '   }\n'
          '}'
          '\n'
          '\n'
          '调用Provider实例中的参数方法: context.watch<T>().paramsName\n'
          '\n'
          '调用Provider实例中的函数方法: context.read<T>().funcName()\n'
          '\n'
          '本示例中实现一次挂载，多处调用的方式构建\n'
          '优点：一次挂载在context中，子类可以通过context获取到\n'
          '缺点：与原生Flutter setState一样，通知页面更新时，遍历context，所有Provider包裹下的\n'
          'Widget都被触发build，追求最少代码快速开发，无法精准控制Widget刷新，耗费性能\n'
          '\n'
          '本方法适用于简单的页面展示，如菜单详情、列表展示、物品详情等\n'
          '不适用于对性能有高性能追求的页面，如：批量动画展示、快速构建视图等`\n',
    );
  }
}

class ProviderProvider with ChangeNotifier {
  int count;

  ProviderProvider() {
    count = 0;
  }

  void add() {
    count += 1;
    notifyListeners();
  }
}
