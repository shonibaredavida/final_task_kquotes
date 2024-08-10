import 'dart:convert';
import 'package:final_task_kquotes/utils/constants/text.dart';
import 'package:http/http.dart' as http;

var _loadedQuotes = [];
Future<List<dynamic>> getQuotes() async {
  final url = Uri.parse(QuoteString.url + QuoteString.endPoint);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    _loadedQuotes = data.values.toList().first;
    return _loadedQuotes;
  } else {
    throw Exception('Sorry, Unable to load quotes.');
  }
}
