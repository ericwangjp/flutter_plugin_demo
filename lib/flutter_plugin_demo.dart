import 'flutter_plugin_demo_platform_interface.dart';

class FlutterPluginDemo {
  Future<String?> getPlatformVersion() {
    return FlutterPluginDemoPlatform.instance.getPlatformVersion();
  }

  Future<String?> getScreenWidth() {
    return FlutterPluginDemoPlatform.instance.getScreenWidth();
  }

  //  直接 dart 实现
  int getScreenHeight() {
    return 1080;
  }
}
