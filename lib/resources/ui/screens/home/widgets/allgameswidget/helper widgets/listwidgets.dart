import 'package:flutter/material.dart';
import '../../../../../../models/home/allgames/allgamesmodel.dart';
import 'allgamescard.dart';

class AllGamesWidget extends StatelessWidget {
  const AllGamesWidget({super.key, required this.allGames});

  final List<AllGamesModel> allGames;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 5,
      itemCount: allGames.length,
      itemBuilder: (context, i) => AllGamesCard(
        gameName: allGames[i].gameName.toString(),
        genreNplatform: allGames[i].platform.toString(),
      ),
    );
  }
}
