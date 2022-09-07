import 'gamemodel.dart';

class Result {
  String? name;
  String? imageBackground;
  List<GameModel> games;

  Result({
    this.name,
    this.imageBackground,
    List<GameModel>? games,
  }) : games = games ?? [];

  factory Result.fromMap(Map<dynamic, dynamic> map) {
    return Result(
        name: map['name'],
        imageBackground: map['image_background'],
        games:
            (map["games"] as List).map((x) => GameModel.fromMap(x)).toList());
  }
}
