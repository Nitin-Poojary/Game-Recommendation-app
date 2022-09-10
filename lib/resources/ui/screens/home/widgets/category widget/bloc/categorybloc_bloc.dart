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
    ApiRepository apiRepository = ApiRepository();

    on<GetAllCategories>((event, emit) async {
      emit(CategoryblocLoading());

      try {
        response = await apiRepository.fetchAllGames() as List<Result>;
        emit(CategoryBlocLoaded(results: response));
      } catch (e) {
        emit(CategoryBlocError());
      }
    });
    on<CategoryBlocSelected>((event, emit) {
      emit(GameListLoading());
      if (event.id < 0) {
        emit(CategoryBlocLoaded(results: response));
      } else {
        emit(CategorySelected(
            allGamesModel: apiRepository.fetchGamesList(event.id)));
      }
    });
  }
}
