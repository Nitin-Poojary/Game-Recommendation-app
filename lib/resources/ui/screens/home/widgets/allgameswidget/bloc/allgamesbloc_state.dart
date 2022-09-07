part of 'allgamesbloc_bloc.dart';

enum Status { loading, loaded, error }

class AllgamesLoadedBloc extends Equatable {
  final Status status;
  final List<Result> apiResponse;

  AllgamesLoadedBloc({
    this.status = Status.loading,
    List<Result>? apiResponse,
  }) : apiResponse = apiResponse ?? [];

  @override
  List<Object> get props => [status, apiResponse];
}
