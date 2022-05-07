import 'package:do_an/modules/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../widget/chat_item_widget.dart';

class ChatPage extends GetView<ChatController>{
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chat",
          style: AppStyles.textNormalWhiteSemiBold,
        ),
        backgroundColor: greenMoney,
        automaticallyImplyLeading: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width(10)),
                    child: TabBar(
                      onTap: (int index) {
                        controller.currentIndex.value = index;
                      },
                     // isScrollable: true,
                      indicatorColor: amber,
                      indicatorWeight: 2,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: width(2), color: amber),
                          insets: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h)),
                      labelColor: amber,
                      unselectedLabelColor: lightDarkHintText.withOpacity(0.74),
                      tabs:  [
                        Tab(
                          text: "Tất cả ",
                        ),
                        Tab(
                          text: "Tin bán",
                        ),
                        Tab(
                          text: "Tin mua",
                        )
                      ],
                    ),
                  )),
            ];
          },
          body: TabBarView(
            children: [
              buildChatUserChat(),
              buildChatUserChat(),
              buildChatUserChat(),
            ],
          ),
        ),
      )
    );
  }
  Widget buildChatUserChat(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16,left: 16,right: 16),
            child: TextField(
              controller: controller.controller,
              onChanged: (value){
                controller.search(value);

              },
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.grey.shade100
                    )
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: controller.listChat.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return ChatItemWidget(
                chatUser: controller.listChat[index],
              );
            },
          ),
        ],
      ),
    );
  }

}