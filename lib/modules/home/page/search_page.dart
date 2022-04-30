import 'package:do_an/modules/home/controller/search_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../utils/widget/cache_image.dart';
import '../widget/search_bar.dart';

class SearchPage extends GetView<SearchController> {
   const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: width(12),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: SearchBar(
            textEditingController: controller.searchController,
            onChanged: (text) {
              controller.searchPost(text);
            }),

      ),
      body: ListView(
        children: [
          buildHistoryList(),

          Obx(() =>  buildTextSearch(controller.keyword.value)),

          buildSortPost(),
          buildListPostSearch()
        ],
      ),
    );
  }

  Widget buildHistoryList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lịch sử tìm kiếm",
                style: AppStyles.textLargeBlackSemiBold,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width(10)),
                child: Icon(Icons.delete, size: size(22),color: grey_4,),
              )
            ],
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
              )),
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
      width: width(40),
      margin: EdgeInsets.symmetric(horizontal: width(10), vertical: height(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: width(1),
          color: lightDarkHintText
        )
      ),
      child: Center(
        child: Text(text, style: AppStyles.textNormalDarkSemiBold,),
      ),
    );
  }

  Widget buildTextSearch(String value){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
      child: RichText(
        text: TextSpan(
          text: "Kết quả tìm kiếm với từ khoá :",
          style: AppStyles.textNormalBlackMedium,
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: AppStyles.textNormalGreenSemiBold,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSortPost(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width(10)),
            child: Text("Sắp xếp theo : ", style: AppStyles.textNormalBlackMedium,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width(5), vertical: height(5)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: grey_5
            ),
            child: Center(
              child: Text("Giá", style: AppStyles.textSmallBlackRegular,),
            ),
          ),
          SizedBox(width: width(10),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width(5), vertical: height(5)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey_5
            ),
            child: Center(
              child: Text("Thời gian", style: AppStyles.textSmallBlackRegular,),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListPostSearch(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(20)),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
       // controller: scrollController,
        itemCount: 6,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          return buildItemPostSearch(context, index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            indent: width(12),
            endIndent: width(12),
            height: height(1),
          );
        },
      ),
    );
  }
  Widget buildItemPostSearch (BuildContext context, int index){
    return Container(
      height: height(120),
      //width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width(60),
            width: width(80),
            child: CacheImage(
              imageUrl: MyImage.imageBanner,
              boxFit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: width(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Tên sản phẩm này, ..............", style: AppStyles.textNormalBlackMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                      )
                    ],
                  ),
                  SizedBox(
                   height: height(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3,2 tỷ", style: AppStyles.textSmallRedMedium,),
                      Text ("19/04",style: AppStyles.textSmallDarkNormal,)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
