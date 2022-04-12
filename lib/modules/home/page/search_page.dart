import 'package:do_an/modules/home/controller/search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../widget/search_bar.dart';

class SearchPage extends GetView<SearchController> {
   SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: SearchBar(
            textEditingController: controller.searchController,
            onChanged: (text) {
              controller.searchTransaction(text);
            }),
        actions: [
          Container(
            child: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }

  Widget buildHistoryList() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Lịch sử tìm kiếm",
            style: AppStyles.textLargeBlackSemiBold,
          ),
          SizedBox(
            height: height(15),
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: width(10),
                  spacing: width(10),
                  children: controller.text
                      .map((i) => buildItem(i))
                      .toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height(15),
          )
        ],
      ),
    );
  }


  Widget buildItem(String text){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey
      ),
      child: Text(text, style: AppStyles.textNormalWhiteSemiBold,),
    );
  }

  Widget buildSuggetsList(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Đề xuất tìm kiếm",
            style: AppStyles.textLargeBlackSemiBold,
          ),
          SizedBox(
            height: height(15),
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: width(10),
                  spacing: width(10),
                  children: controller.text
                      .map((i) => buildItem(i))
                      .toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height(15),
          )
        ],
      ),
    );
  }
}
