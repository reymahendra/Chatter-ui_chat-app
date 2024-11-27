import 'package:chatter/screens/screens.dart';
import 'package:chatter/theme.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(DevicePreview(builder: (context) => const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTheme = AppTheme;
    var appTheme2 = AppTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.light(),
      darkTheme: appTheme2.dark(),
      themeMode: ThemeMode.dark,
      title: 'Chatter',
      home: const Welcome(),
    );
  }
}

extension on Type {
  light() {}

  dark() {}
}
