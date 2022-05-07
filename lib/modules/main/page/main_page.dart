import 'package:do_an/modules/post/page/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../modules.dart';

class MainPage extends StatelessWidget {
  final MainController _controller = Get.put(MainController());
  late PageController pageController;

  MainPage(){
    pageController = PageController(
      initialPage: _controller.currentIndex.value,
      keepPage: true,
    );
    // _controller.initData();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: WillPopScope(
          onWillPop: onWillPop,
          child: buildPageView(),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),

      );
  }

  Widget buildBottomNavigationBar() {
    return Obx(() =>
        BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          currentIndex: _controller.currentIndex.value,
          selectedItemColor: greenMoney,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          unselectedItemColor: lightDarkHintText,
          onTap: bottomTapped,
          items: [
            barItem(
                label: "Trang chủ",
                iconImage: MyIcon.homeIcon,
                index: 0
            ),
            barItem(
                label: "Tin của tôi",
                iconImage: MyIcon.myPostIcon,
                index: 1
            ),

            barItem(
                label: "Đăng tin",
                iconImage: MyIcon.addPostIcon,
                index: 2
            ),
            barItem(
                label: "Thông báo",
                iconImage: MyIcon.notificationIcon,
                index: 3
            ),
            barItem(
                label: "Cá nhân",
                iconImage: MyIcon.profileIcon,
                index: 4
            ),
          ],
        ));
  }


  PageView buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children:  [
        HomePage(),
        PostPage(),
        AddPostPage(),
        NotificationPage(),
        AccountPage(),
      ],
    );
  }

  BottomNavigationBarItem barItem({
    required String label,
    required String iconImage,
    String redNotification = "",
    required int index,
    int? numberMessageCount
  }){

    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        margin: const EdgeInsets.only(bottom: 3),
        child: SizedBox(
          width: width(35),
          height: height(25),
          child: Stack(
            children: [

              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  iconImage,
                  width: width(34),
                  height: height(28),
                  fit: BoxFit.cover,
                  color: _controller.currentIndex.value == index ? greenMoney : lightDarkHintText,
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }

  void bottomTapped(int index) {

    _controller.currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.decelerate);

  }

  void onPageChanged(int index) {

    _controller.currentIndex.value = index;

  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }
}
