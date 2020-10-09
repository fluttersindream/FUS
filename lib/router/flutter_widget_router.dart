
import 'package:FUS/page/study_page/flutter_widget/canvas_page.dart';
import 'package:FUS/page/study_page/flutter_widget/flutter_ui_detail.dart';

final Map<String, Function> flutterWidgetRouter = {
  'canvasPage': () => (_) => CanvasPage(),
  'flutterUiDetail': (String title) => (_) => FlutterUiDetail(title),
};