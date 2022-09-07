import 'package:flutter/material.dart';

class AllGamesCard extends StatelessWidget {
  const AllGamesCard(
      {Key? key, required this.gameName, required this.genreNplatform})
      : super(key: key);

  final String gameName;
  final String genreNplatform;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.cyan[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              gameName,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(genreNplatform),
          ],
        ),
      ),
    );
  }
}
