class QuotesResponseModel {
  final List<Quote> quotes;
  final int total;
  final int skip;
  final int limit;

  QuotesResponseModel({
    required this.quotes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory QuotesResponseModel.fromJson(Map<String, dynamic> json) {
    var quotesList = json['quotes'] as List;
    List<Quote> quotes = quotesList.map((quote) => Quote.fromJson(quote)).toList();

    return QuotesResponseModel(
      quotes: quotes,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

}

class Quote {
  final int id;
  final String quote;
  final String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }

}