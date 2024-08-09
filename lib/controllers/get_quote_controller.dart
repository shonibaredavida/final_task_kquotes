import 'package:final_task_kquotes/functions/get_quotes.dart';
import 'package:get/get.dart';

class GetQuotesController extends GetxController {
  final _quotesList = [].obs;

  get quotesList => _quotesList;

  Future<void> _getQuotes() async {
    _quotesList.value = await getQuotes();

    if (_quotesList.isNotEmpty) {
      refresh();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _getQuotes();

    super.onInit();
  }
}
/* class GetQuotesController extends GetxController {
  var _quotesList = [].obs;
  var _allQuotesList = [].obs;
  get quotesList => _quotesList;
  get allQuotesList => _allQuotesList;
  @override
  void onInit() {
    // TODO: implement onInit
    _getQuotes();

    super.onInit();
  }

  void searchList(String searchText) {
    List newlist = [];
    if (searchText.isEmpty) {
      newlist = _allQuotesList;
      //  print("nothin");
    } else {
      newlist
          .where((element) => element['quote']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    }
    _quotesList.value = newlist;

//    print(_quotesList.length.toString() + searchText);
    //  print(_allQuotesList.length.toString() + searchText);
  }

  Future<void> _getQuotes() async {
    _allQuotesList.value = await getQuotes();
    //  _allQuotesList.value = newQuotesssss;
    _quotesList = _allQuotesList;
    print(_quotesList.length);
    refresh();
  }
}
 */