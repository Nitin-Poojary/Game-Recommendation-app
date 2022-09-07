import 'package:http/http.dart' as http;
import '../models/api models/gameapimodel.dart';

class ApiProvider {
  String baseURI =
      "https://api.rawg.io/api/platforms?key=204de54710e4499aacd1e8a0da259f4e";

  Future<GameApiModel> fetchApi() async {
    final response = await http.get(Uri.parse(baseURI));

    if (response.statusCode == 200) {
      return GameApiModel.fromJson(response.body);
    }
    return GameApiModel.withError(error: "Data not Found");
  }
}
