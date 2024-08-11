import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_controller.dart';
import '../services/quote_services.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/my_drawer_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomePageController(quoteService: QuoteService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text(
          'KQuotes',
          style: TextStyle(
              fontSize: AppSizes.fontSizeLg,
              fontWeight: AppSizes.fontWeightBold),
        ),
      ),
      body: SafeArea(child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LinearProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
                child: TextField(
                  onChanged: (value) =>
                      controller.filterQuotes(searchText: value),
                  decoration: InputDecoration(
                      hintText: "Search Quotes",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              const SizedBox(
                height: AppSizes.mediumDefaultSpace,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.filteredQuotesList.length,
                    itemBuilder: (context, index) {
                      final quote = controller.filteredQuotesList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 203, 233, 204),
                          ),
                          margin: const EdgeInsets.all(5),
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.radio_button_checked,
                                    size: AppSizes.fontSizeXLg,
                                    color: primaryColor.withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              "\"${quote.quote} \"",
                              style: const TextStyle(
                                  fontSize: AppSizes.fontSizeSmb),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, right: 8),
                                  child: Text(
                                    quote.author,
                                    style: const TextStyle(
                                        fontSize: AppSizes.fontSizeSm),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ); /* QuoteListItem(
                        quoteItem: quote,
                      ); */
                    }),
              )
            ],
          );
        }
      })),
    );
  }
}
