import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/utils/constants/colors.dart';

import '../functions/get_quotes.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List quotesList = [];
  @override
  void initState() {
    // TODO: implement initState

    _getQuotes();
    super.initState();
  }

  Future<void> _getQuotes() async {
    quotesList = await getQuotes();
    if (quotesList.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
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
              AppSizes.mds * 1.5,
              AppSizes.md,
              AppSizes.mds * 1.5,
              AppSizes.md * 2,
            ),
            child: TextField(
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
                itemCount: quotesList.length,
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
                      "\"${quotesList[index]['quote']} \"",
                      style: const TextStyle(fontSize: AppSizes.fontSizeMs),
                    ),
                    subtitle: Text(
                      quotesList[index]['author'],
                      style: const TextStyle(fontSize: AppSizes.fontSizeSm),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
