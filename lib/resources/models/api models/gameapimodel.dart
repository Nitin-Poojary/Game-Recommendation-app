import 'dart:convert';
import 'gamelistmodel.dart';

class GameApiModel {
  List<Result> results;
  String? error;

  GameApiModel({
    List<Result>? results,
  }) : results = results ?? [];

  GameApiModel.withError({required this.error, List<Result>? results})
      : results = results ?? [];

  factory GameApiModel.fromMap(Map<String, dynamic> map) {
    return GameApiModel(
        results:
            (map["results"] as List).map((x) => Result.fromMap(x)).toList());
  }

  factory GameApiModel.fromJson(String source) {
    return GameApiModel.fromMap(json.decode(source));
  }
}
