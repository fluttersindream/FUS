
import 'package:FUS/page/study_page/flutter_widget/flutter_widget_page.dart';
import 'package:FUS/page/study_page/sound_widget/record_page.dart';

final Map<String, Function> studyRouter = {
  'soundWidgetPage': () => (_) => RecordPage(),
  'flutterWidgetPage': () => (_) => FlutterWidgetPage(),
};