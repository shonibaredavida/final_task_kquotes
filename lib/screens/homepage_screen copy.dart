import 'package:final_task_kquotes/functions/get_quotes.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:final_task_kquotes/widget/my_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/utils/constants/colors.dart';

class HomePageScreenTest extends StatefulWidget {
  const HomePageScreenTest({super.key});

  @override
  State<HomePageScreenTest> createState() => _HomePageScreenTestState();
}

class _HomePageScreenTestState extends State<HomePageScreenTest> {
  var _quotesList = [];
  var _allQuotesList = [];
  @override
  @override
  void initState() {
    _getQuotes();
    super.initState();
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
    _quotesList = newlist;

//    print(_quotesList.length.toString() + searchText);
    //  print(_allQuotesList.length.toString() + searchText);
  }

  Future<void> _getQuotes() async {
    _allQuotesList = await getQuotes();
    //  _allQuotesList.value = newQuotesssss;
    _quotesList = _allQuotesList;
    // print(_quotesList.length);
  }

  @override
  Widget build(BuildContext context) {
    //  final controller = Get.put(GetQuotesController());
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Quotes',
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
              AppSizes.md * 1.5,
              AppSizes.lg,
              AppSizes.md * 1.5,
              AppSizes.lg * 2,
            ),
            child: TextField(
              onChanged: (value) => searchList(value),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: AppSizes.xs, horizontal: AppSizes.sm),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Expanded(
            child: Container(
                color: whiteColor,
                child: ListView.separated(
                  itemCount: _quotesList.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      leading: Container(
                        width: 10,
                        height: 10,
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.menu_book_outlined,
                          size: AppSizes.fontSizeXLg,
                          color: primaryColor,
                        ),
                      ),
                      title: Text(
                        "$index\"${_quotesList[index]['quote']} \"",
                        style: const TextStyle(fontSize: AppSizes.fontSizeSmb),
                      ),
                      subtitle: Text(
                        _quotesList[index]['author'],
                        style: const TextStyle(fontSize: AppSizes.fontSizeSm),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                )),
          ),
        ],
      ),
    );
  }
}
