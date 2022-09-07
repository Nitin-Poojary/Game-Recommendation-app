import '../api/apiprovider.dart';
import '../models/api models/gameapimodel.dart';
import '../models/api models/gamelistmodel.dart';

class ApiRepository {
  ApiProvider apiProvider = ApiProvider();
  GameApiModel apiResponse = GameApiModel();

  Future<List<Result>?> fetchAllGames() async {
    apiResponse = await apiProvider.fetchApi();

    return apiResponse.results;
  }
}
