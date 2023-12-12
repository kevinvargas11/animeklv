import 'package:animeklv/UI/widgets/scroll_populares/main_scroll_populares.dart';
import 'package:flutter/material.dart';

class MainAnime extends StatelessWidget {
  const MainAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScrollPopulares(),
    );
  }
}
