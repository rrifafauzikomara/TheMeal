import 'package:http/http.dart' as http;
import 'package:themeal/model/food.dart';

class IngredientsService {
  String url = "https://www.themealdb.com/api/json/v1/1";

  Future<Food> getIngredients(http.Client client) async {
    try {
      final response = await http.get("$url/list.php?i=list");
      if (response.statusCode == 200) {
        return foodFromJson(response.body);
      } else {
        throw Exception('Get Ingredients failed');
      }
    } finally {
      client.close();
    }
  }
}