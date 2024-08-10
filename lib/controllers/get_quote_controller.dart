import 'package:final_task_kquotes/functions/get_quotes.dart';
import 'package:get/get.dart';

class GetQuotesController extends GetxController {
  List<dynamic> allQuotesList = [];
  Rx<List<dynamic>> foundQuotes = Rx<List<dynamic>>([]);
  Rx<bool> noResult = false.obs;
  Future<void> _getQuotes() async {
    allQuotesList = await getQuotes();
    foundQuotes.value = allQuotesList;
  }

  @override
  void onInit() {
    _getQuotes();
    refresh();
    super.onInit();
  }

  void filterQuotes(String quoteText) {
    noResult.value = false;
    List<dynamic> results = [];
    if (allQuotesList.isEmpty) {
      results = allQuotesList;
    } else {
      results = allQuotesList.where((element) {
        return element["quote"]
                .toString()
                .toLowerCase()
                .contains(quoteText.toLowerCase()) ||
            element["author"]
                .toString()
                .toLowerCase()
                .contains(quoteText.toLowerCase());
      }).toList();
    }
    if (results.isEmpty && quoteText.isNotEmpty) noResult.value = true;
    foundQuotes.value = results;
  }
}
