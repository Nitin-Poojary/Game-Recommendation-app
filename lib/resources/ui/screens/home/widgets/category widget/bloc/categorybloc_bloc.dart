import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gamesrecommendation/resources/repository/apirepository.dart';

import '../../../../../../models/api models/gamelistmodel.dart';

part 'categorybloc_event.dart';
part 'categorybloc_state.dart';

class CategoryblocBloc extends Bloc<CategoryblocEvent, CategoryblocState> {
  CategoryblocBloc() : super(CategoryblocLoading()) {
    on<GetAllCategories>((event, emit) async {
      emit(CategoryblocLoading());

      ApiRepository apiRepository = ApiRepository();
      try {
        List<Result>? response = await apiRepository.fetchAllGames();
        emit(CategoryBlocLoaded(results: response));
      } catch (e) {
        emit(CategoryBlocError());
      }
    });
  }
}
