import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_plugin_demo/flutter_plugin_demo.dart';
import 'package:flutter_plugin_demo/flutter_plugin_demo_platform_interface.dart';
import 'package:flutter_plugin_demo/flutter_plugin_demo_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPluginDemoPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPluginDemoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getScreenWidth() => Future.value('375');
}

void main() {
  final FlutterPluginDemoPlatform initialPlatform = FlutterPluginDemoPlatform.instance;

  test('$MethodChannelFlutterPluginDemo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPluginDemo>());
  });

  test('getPlatformVersion', () async {
    FlutterPluginDemo flutterPluginDemoPlugin = FlutterPluginDemo();
    MockFlutterPluginDemoPlatform fakePlatform = MockFlutterPluginDemoPlatform();
    FlutterPluginDemoPlatform.instance = fakePlatform;

    expect(await flutterPluginDemoPlugin.getPlatformVersion(), '42');
  });

  test('getScreenWidth', () async {
    FlutterPluginDemo flutterPluginDemoPlugin = FlutterPluginDemo();
    MockFlutterPluginDemoPlatform fakePlatform = MockFlutterPluginDemoPlatform();
    FlutterPluginDemoPlatform.instance = fakePlatform;

    expect(await flutterPluginDemoPlugin.getScreenWidth(), '375');
  });
}
