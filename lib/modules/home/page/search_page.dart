import 'package:do_an/models/post/history_search_model.dart';
import 'package:do_an/modules/home/controller/search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../models/user/post_user_model.dart';
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
      body: Stack(
        children: [
          ListView(
            children: [
              Obx(() => buildHistoryList(controller.historySearch.value)),
              Obx(() => Visibility(
                    visible: controller.isFirstSearch.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => buildTextSearch(controller.keyword.value)),
                        buildSortPost(),
                        SizedBox(height:height(10)),
                        Obx(() =>
                            buildListPostSearch(listPost: controller.listPosts))
                      ],
                    ),
                  ))
            ],
          ),
          Obx(() => loadingLogin(controller.isLoading.value))
        ],
      ),
    );
  }

  Widget buildHistoryList(HistorySearch historySearch) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(15), vertical: height(10)),
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
              InkWell(
                onTap: () {
                  controller.setListHistorySearch();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(10)),
                  child: Icon(
                    Icons.delete,
                    size: size(22),
                    color: grey_4,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height(15),
          ),
          historySearch.listSearch?.isNotEmpty == true
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: width(10),
                      spacing: width(10),
                      children: controller.historySearch.value.listSearch!
                          .map((i) => buildItem(i))
                          .toList(),
                    )
                  ],
                )
              : Container(),
          SizedBox(
            height: height(15),
          )
        ],
      ),
    );
  }

  Widget buildItem(ListSearch listSearch) {
    return Stack(
      children: [
        Visibility(
          visible: listSearch.isSelected ?? false,
          child: Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(width(3)),
                  child: Icon(
                    Icons.clear,
                    size: size(12),
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (listSearch.isSelected == false) {
              controller.searchController.text = listSearch.searchText ?? "";
              controller.searchPost("");
            }else{
              controller.deleteHistorySearch(listSearch);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width(15), vertical: height(7)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: height(1), color: lightDarkHintText)),
            child: Center(
              child: Text(
                listSearch.searchText ?? "",
                style: AppStyles.textSmallBlackRegular,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextSearch(String value) {
    return Obx(() => Visibility(
          visible: controller.keyword.value != "",
          child: Container(
            padding: EdgeInsets.only(
                left: width(20), right: width(20), bottom: height(10)),
            child: RichText(
              text: TextSpan(
                text: "Kết quả tìm kiếm với từ khoá : ",
                style: AppStyles.textNormalBlackMedium,
                children: <TextSpan>[
                  TextSpan(
                    text: value,
                    style: AppStyles.textNormalGreenSemiBold,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildSortPost() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width(10)),
            child: Text(
              "Sắp xếp theo : ",
              style: AppStyles.textNormalBlackMedium,
            ),
          ),
          InkWell(
            onTap: (){
              controller.sortMoneyListPost();
            },
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: width(12), vertical: height(5)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: grey_5),
              child: Center(
                child: Text(
                  "Giá",
                  style: AppStyles.textSmallBlackRegular,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width(10),
          ),
          InkWell(
            onTap: (){
              controller.sortTimeListPost();
            },
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: width(12), vertical: height(5)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: grey_5),
              child: Center(
                child: Text(
                  "Thời gian",
                  style: AppStyles.textSmallBlackRegular,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListPostSearch({required List<Posts> listPost}) {
    return (listPost.isEmpty && controller.searchController.text != "" && controller.isLoading.value == false)  ? Padding(
      padding: EdgeInsets.only(top: height(60)),
      child: Center(
        child: Text("Không có bài đăng nào được tìm thấy" , style: AppStyles.textSmallBlackRegular,),
      ),
    ) : Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(10), vertical: height(00)),
      child: Column(
        children: List.generate(listPost.length,
            (index) => buildItemPostSearch(index, listPost[index])),
      ),
    ) ;
  }

  Widget buildItemPostSearch(int index, Posts posts) {
    String image = MyImage.imageBanner;
    if (posts.media?.isNotEmpty == true) {
      image = posts.media?.first.fileDownloadUri ?? MyImage.imageBanner;
    }
    return InkWell(
      onTap: (){
        Get.toNamed(RouterLink.productDetailPage, arguments: posts.id);
      },
      child: Container(
        height: height(120),
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: width(60),
              width: width(80),
              child: CacheImage(
                imageUrl: image,
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
                          child: Text(
                            posts.content ?? '',
                            style: AppStyles.textNormalBlackMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          CommonUtil.formatMoney(posts.money ?? 0),
                          style: AppStyles.textSmallRedMedium,
                        ),
                        Text(
                          CommonUtil.parseDateTime(posts.createTime ?? ""),
                          style: AppStyles.textSmallDarkNormal,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
