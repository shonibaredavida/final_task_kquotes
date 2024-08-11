import 'package:get/get.dart';

import '../models/quote_response_model.dart';
import '../models/user_model.dart';
import '../services/firebase_service.dart';
import '../services/quote_services.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var isProfileLoading = true.obs;
  RxList<Quote> quotesList = <Quote>[].obs;
  RxList<Quote> filteredQuotesList = <Quote>[].obs;
  var errorMessage = ''.obs;
  var userModel = UserModel(fullName: '', email: '').obs;

  final QuoteService quoteService;
  HomePageController({required this.quoteService});

  @override
  void onInit() {
    fetchQuotes();
    fetchUserDetails();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      isLoading(true);
      var quotesResponse = await quoteService.fetchQuotes();
      quotesList.assignAll(quotesResponse.quotes);
      filteredQuotesList.assignAll(quotesList);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void filterQuotes({required String searchText}) {
    if (searchText.isEmpty) {
      filteredQuotesList.assignAll(quotesList);
    } else {
      filteredQuotesList.assignAll(quotesList
          .where((quote) =>
              quote.quote.toLowerCase().contains(searchText.toLowerCase()) ||
              quote.author.toLowerCase().contains(searchText.toLowerCase()))
          .toList());
    }
  }

  void fetchUserDetails() async {
    try {
      isProfileLoading(true);
      var userDetails = await FirebaseService().getUserFromFireStore();
      if (userDetails != null) {
        userModel.value = userDetails;
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isProfileLoading(false);
    }
  }
}
