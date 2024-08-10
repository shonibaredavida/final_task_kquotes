import 'package:final_task_kquotes/controllers/get_quote_controller.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:final_task_kquotes/widget/my_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/utils/constants/colors.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetQuotesController());
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
              onChanged: (value) => controller.filterQuotes(value),
              decoration: InputDecoration(
                  hintText: "Search Quotes",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: AppSizes.xs, horizontal: AppSizes.lg),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Expanded(
            child: Container(
                color: whiteColor,
                child: Obx(
                  () => controller.noResult.value
                      ? const Center(
                          child: Text("No Quote matches your Input"),
                        )
                      : ListView.separated(
                          itemCount: controller.foundQuotes.value.length,
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
                                "\"${controller.foundQuotes.value[index]['quote']} \"",
                                style: const TextStyle(
                                    fontSize: AppSizes.fontSizeSmb),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  controller.foundQuotes.value[index]['author'],
                                  style: const TextStyle(
                                      fontSize: AppSizes.fontSizeSm),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
<<<<<<< Updated upstream
=======
                        title: Text(
                          "$index\"${controller.quotesList[index]['quote']} \"",
                          style:
                              const TextStyle(fontSize: AppSizes.fontSizeSmb),
                        ),
                        subtitle: Text(
                          controller.quotesList[index]['author'],
                          style: const TextStyle(fontSize: AppSizes.fontSizeSm),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
>>>>>>> Stashed changes
                )),
          ),
        ],
      ),
    );
  }
}
