import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:onwallpapers/screens/home.dart';
import 'package:onwallpapers/theme/theme_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeState>(
      create: (_) => ThemeState(),
      child: MaterialApp(
        title: 'Wallpapers',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
