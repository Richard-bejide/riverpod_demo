import 'package:riverpod_demo/models/cat_fact_model.dart';
import 'package:http/http.dart' as http;

class CatFactServices {
  final url = 'https://catfact.ninja/fact';

  Future<CatFactModel> getCatFact() async {
    final response = await http.get(Uri.parse(url));
    return catFactModelFromJson(response.body);
  }
}
