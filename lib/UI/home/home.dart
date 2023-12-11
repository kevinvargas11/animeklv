import 'package:animeklv/UI/screens/main_animes.dart';
import 'package:animeklv/UI/themes/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: MainAnime(),
    );
  }
}
