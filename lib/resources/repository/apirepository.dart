import '../api/apiprovider.dart';
import '../models/api models/gameapimodel.dart';
import '../models/api models/gamelistmodel.dart';
import '../models/home/allgames/allgamesmodel.dart';

class ApiRepository {
  ApiProvider apiProvider = ApiProvider();
  GameApiModel apiResponse = GameApiModel();

  Future<List<Result>?> fetchAllGames() async {
    apiResponse = await apiProvider.fetchApi();

    return apiResponse.results;
  }

  List<AllGamesModel> fetchGamesList(int id) {
    Result result = apiResponse.results[id];
    List<AllGamesModel> gamesModel = [];

    for (var i in result.games) {
      gamesModel.add(
        AllGamesModel(
          gameName: i.name.toString(),
          platform: result.name.toString(),
        ),
      );
    }
    return gamesModel;
  }
}
