part of 'categorybloc_bloc.dart';

abstract class CategoryblocState extends Equatable {
  const CategoryblocState();

  @override
  List<Object> get props => [];
}

class CategoryblocLoading extends CategoryblocState {}

class CategoryBlocLoaded extends CategoryblocState {
  final List<Result> results;

  CategoryBlocLoaded({
    List<Result>? results,
  }) : results = results ?? [];

  @override
  List<Object> get props => [results];
}

class CategorySelected extends CategoryblocState {
  final List<AllGamesModel> allGamesModel;

  const CategorySelected({
    required this.allGamesModel,
  });

  @override
  List<Object> get props => [allGamesModel];
}

class CategoryBlocError extends CategoryblocState {
  @override
  List<Object> get props => [];
}
