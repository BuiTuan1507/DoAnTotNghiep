import 'package:do_an/modules/post/page/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                redNotification: _controller.settingUserModel.value.notification.toString(),
                index: 3,
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
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  iconImage,
                  width: width(34),
                  height: height(28),
                  fit: BoxFit.cover,
                  color: _controller.currentIndex.value == index ? greenMoney : lightDarkHintText,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Visibility(
                  visible: redNotification.isNotEmpty ? true : false,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width(2), vertical: height(1)),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      minWidth: width(20),
                      minHeight: height(20),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor("#D82828"),
                    ),
                    child: Text(
                      redNotification,
                      style: GoogleFonts.sarabun(
                        fontSize: size(9),
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
        duration: const Duration(milliseconds: 100), curve: Curves.decelerate);

  }

  void onPageChanged(int index) {

    _controller.currentIndex.value = index;

  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }
}
