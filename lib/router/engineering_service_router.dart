import 'package:FUS/page/engineering_service_page/provider_demo.dart';
import 'package:FUS/page/engineering_service_page/radar_demo.dart';
import 'package:FUS/page/engineering_service_page/tabs/tab1.dart';
import 'package:FUS/page/engineering_service_page/tabs_demo.dart';
import 'package:FUS/page/engineering_service_page/water_ripple_demo.dart';

final Map<String, Function> engineeringServiceRouter = {
  "tab1": (String name) => (_) => Tab1(name),
  'ProviderPage': () => (_) => ProviderPage(),
  'WaterRippleDemo': () => (_) => WaterRippleDemo(),
  'RadarDemo': () => (_) => RadarDemo(),
  'TabsDemo': () => (_) => TabsDemo(),
};
