import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gamesrecommendation/resources/models/api%20models/gamelistmodel.dart';
import 'package:gamesrecommendation/resources/repository/apirepository.dart';

part 'allgamesbloc_event.dart';
part 'allgamesbloc_state.dart';

class AllgamesblocBloc extends Bloc<AllgamesblocEvent, AllgamesLoadedBloc> {
  AllgamesblocBloc() : super(AllgamesLoadedBloc()) {
    on<GetAllGames>((event, emit) async {
      emit(AllgamesLoadedBloc(status: Status.loading));

      ApiRepository apiRepository = ApiRepository();
      try {
        List<Result>? response = await apiRepository.fetchAllGames();
        emit(AllgamesLoadedBloc(status: Status.loaded, apiResponse: response));
      } catch (e) {
        emit(AllgamesLoadedBloc(status: Status.error));
      }
    });
  }
}
