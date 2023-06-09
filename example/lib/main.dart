import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plugin_demo/flutter_plugin_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _screenWidth = 'Unknown';
  final _flutterPluginDemoPlugin = FlutterPluginDemo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _getScreenWidth();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterPluginDemoPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _getScreenWidth() async {
    String screenWidth;
    try {
      screenWidth = await _flutterPluginDemoPlugin.getScreenWidth() ?? '0';
    } on PlatformException {
      screenWidth = 'Failed to get screen width.';
    }
    if (!mounted) return;
    setState(() {
      _screenWidth = screenWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n',textScaleFactor: 1.5),
            ),
            Center(
              child: Text('screen width: $_screenWidth\n',textScaleFactor: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
