import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesrecommendation/resources/models/home/allgames/allgamesmodel.dart';
import 'allgamescard.dart';
import 'bloc/allgamesbloc_bloc.dart';

class AllGamesList extends StatelessWidget {
  const AllGamesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AllGamesModel> allGames = [];

    return BlocListener<AllgamesblocBloc, AllgamesLoadedBloc>(
      listener: (context, state) {
        if (state.status == Status.loaded && state.apiResponse.isNotEmpty) {
          for (var i = 0; i < state.apiResponse.length; i++) {
            for (var game in state.apiResponse[i].games) {
              allGames.add(AllGamesModel(
                  gameName: game.name.toString(),
                  platform: state.apiResponse[i].name.toString()));
            }
          }
        }
      },
      child: Container(
        color: Colors.cyan[50],
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Games",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<AllgamesblocBloc, AllgamesLoadedBloc>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == Status.loaded) {
                    return ListView.builder(
                      cacheExtent: 7,
                      itemCount: state.apiResponse.length,
                      itemBuilder: (context, i) => AllGamesCard(
                        gameName: allGames[i].gameName.toString(),
                        genreNplatform: allGames[i].platform.toString(),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Data Not Found",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
