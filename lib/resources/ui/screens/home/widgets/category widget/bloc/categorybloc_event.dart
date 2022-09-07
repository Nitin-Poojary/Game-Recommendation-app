part of 'categorybloc_bloc.dart';

abstract class CategoryblocEvent extends Equatable {
  const CategoryblocEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategories extends CategoryblocEvent {
  @override
  List<Object> get props => [];
}

class CategoryBlocSelected extends CategoryblocEvent {
  final int id;

  const CategoryBlocSelected({
    required this.id,
  });

  CategoryBlocSelected copyWith({
    int? id,
  }) {
    return CategoryBlocSelected(
      id: id ?? this.id,
    );
  }
}
