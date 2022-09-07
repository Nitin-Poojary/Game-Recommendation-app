import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesrecommendation/resources/models/home/allgames/allgamesmodel.dart';
import 'package:gamesrecommendation/resources/ui/screens/home/widgets/allgameswidget/helper%20widgets/listwidgets.dart';
import '../category widget/bloc/categorybloc_bloc.dart';

class AllGamesList extends StatelessWidget {
  const AllGamesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AllGamesModel> allGames = [];

    return BlocListener<CategoryblocBloc, CategoryblocState>(
      listener: (context, state) {
        if (state is CategoryBlocLoaded && state.results.isNotEmpty) {
          for (var i = 0; i < state.results.length; i++) {
            for (var game in state.results[i].games) {
              allGames.add(AllGamesModel(
                  gameName: game.name.toString(),
                  platform: state.results[i].name.toString()));
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
            BlocBuilder<CategoryblocBloc, CategoryblocState>(
              builder: (context, state) {
                if (state is CategorySelected) {
                  return Text(
                    state.allGamesModel[0].platform,
                    style: Theme.of(context).textTheme.headline5,
                  );
                }
                return Text(
                  "All Games",
                  style: Theme.of(context).textTheme.headline5,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<CategoryblocBloc, CategoryblocState>(
                builder: (context, state) {
                  if (state is CategoryblocLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CategoryBlocLoaded) {
                    return AllGamesWidget(
                      allGames: allGames,
                    );
                  } else if (state is CategorySelected) {
                    return AllGamesWidget(allGames: state.allGamesModel);
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
