part of 'categorybloc_bloc.dart';

abstract class CategoryblocState extends Equatable {
  const CategoryblocState();

  @override
  List<Object> get props => [];
}

class CategoryblocLoading extends CategoryblocState {}

class CategoryBlocLoaded extends CategoryblocState {
  List<Result> results;

  CategoryBlocLoaded({
    List<Result>? results,
  }) : results = results ?? [];

  @override
  List<Object> get props => [results];
}

class CategoryBlocError extends CategoryblocState {
  @override
  List<Object> get props => [];
}
