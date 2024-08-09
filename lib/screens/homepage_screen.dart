import 'package:final_task_kquotes/controllers/get_quote_controller.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/utils/constants/colors.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(GetQuotesController());
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
              AppSizes.md * 1.5,
              AppSizes.lg,
              AppSizes.md * 1.5,
              AppSizes.lg * 2,
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
              child: GetBuilder<GetQuotesController>(builder: (controller) {
                return ListView.separated(
                  itemCount: controller.quotesList.length,
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
                        "\"${controller.quotesList[index]['quote']} \"",
                        style: const TextStyle(fontSize: AppSizes.fontSizeSmb),
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
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
