import 'dart:convert';

import 'package:http/http.dart';
import 'package:product_busymed/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);
  dynamic get() async {
    final Response response = await _client
        .get(Uri.parse(ApiConstants.BASE_URL + 'api/products_top_20'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
