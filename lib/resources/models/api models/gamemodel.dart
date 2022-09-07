class GameModel {
  String? name;

  GameModel({
    this.name,
  });

  factory GameModel.fromMap(Map<dynamic, dynamic> map) {
    return GameModel(
      name: map['name'],
    );
  }
}
