import 'package:animeklv/Domain/peticiones/peticionesd.dart';
import 'package:flutter/material.dart';

class MainAnime extends StatelessWidget {
  const MainAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: Gets().getPopulares,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: (CircularProgressIndicator.adaptive()),
          );
        }
        return ListView.builder(itemBuilder: (context, index) {
          return ListTile();
        });
      },
    ));
  }
}
