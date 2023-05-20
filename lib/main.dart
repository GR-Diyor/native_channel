import 'dart:developer';

import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:untitled7/pages/permission.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  system();
  ints();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Permissions(),
    );
  }
}

ints() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  await FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_LAYOUT_NO_LIMITS);
  await FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED);
}

system() {
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [
    SystemUiOverlay.top,
    SystemUiOverlay.bottom,
  ]);
}
