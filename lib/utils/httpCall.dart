import 'package:http/http.dart' as http;

class HttpCall {
  String url;
  HttpCall(this.url);

  getCurrency() async {
    var response = await http.get(url);
    return response;
  }
}
