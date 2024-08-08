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
