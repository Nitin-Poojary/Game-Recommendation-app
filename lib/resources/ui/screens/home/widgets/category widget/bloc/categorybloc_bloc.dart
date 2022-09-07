import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gamesrecommendation/resources/models/home/allgames/allgamesmodel.dart';
import 'package:gamesrecommendation/resources/repository/apirepository.dart';

import '../../../../../../models/api models/gamelistmodel.dart';

part 'categorybloc_event.dart';
part 'categorybloc_state.dart';

class CategoryblocBloc extends Bloc<CategoryblocEvent, CategoryblocState> {
  CategoryblocBloc() : super(CategoryblocLoading()) {
    List<Result> response = [];

    on<GetAllCategories>((event, emit) async {
      emit(CategoryblocLoading());

      ApiRepository apiRepository = ApiRepository();
      try {
        response = await apiRepository.fetchAllGames() as List<Result>;
        emit(CategoryBlocLoaded(results: response));
      } catch (e) {
        emit(CategoryBlocError());
      }
    });
    on<CategoryBlocSelected>((event, emit) {
      emit(CategoryblocLoading());
      if (event.id < 0) {
        emit(CategoryBlocLoaded(results: response));
      } else {
        Result result = response[event.id];
        List<AllGamesModel> gamesModel = [];

        for (var i in result.games) {
          gamesModel.add(AllGamesModel(
              gameName: i.name.toString(), platform: result.name.toString()));
        }

        emit(CategorySelected(allGamesModel: gamesModel));
      }
    });
  }
}
