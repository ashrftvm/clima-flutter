import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<http.Response> getData(url) async {
    http.Response response = await http.get(url);
    return response;
  }
}
