import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  final String _url = "http://localhost:8000/contactPost/";

  postData(data) async {
    var fullUrl = _url;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(data) async {
    var fullUrl = _url;
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Aceept': 'application/json'};
}
