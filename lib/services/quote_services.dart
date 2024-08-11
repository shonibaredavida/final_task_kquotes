import 'package:dio/dio.dart';
import 'package:my_quote_app/models/quote_response_model.dart';

class QuoteService {
  Future<QuotesResponseModel> fetchQuotes() async {
    final response = await Dio().get('https://dummyjson.com/quotes');
    if(response.statusCode == 200) {
      return QuotesResponseModel.fromJson(response.data);
    }else {
      throw Exception('Failed to fetch quotes');
    }
  }
}