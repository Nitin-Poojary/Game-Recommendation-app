part of 'allgamesbloc_bloc.dart';

abstract class AllgamesblocEvent extends Equatable {
  const AllgamesblocEvent();

  @override
  List<Object> get props => [];
}

class GetAllGames extends AllgamesblocEvent {}
