import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:do_an/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/widget/cache_image.dart';
import '../../../utils/utils.dart';

class ImageProductWidget extends StatefulWidget {
  final List<String>? imageList;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final int? isIndicator;
  final bool? isAutoPlay;
  final Function(int index)? onTap;
  const ImageProductWidget(
      {Key? key,
        required this.imageList,
        this.width,
        this.boxFit,
        this.isIndicator,
        this.isAutoPlay,
        this.height,
        this.onTap})
      : super(key: key);

  @override
  _ImageProductWidgetState createState() => _ImageProductWidgetState();
}

class _ImageProductWidgetState extends State<ImageProductWidget> {
  CarouselController carouselController = CarouselController();
  var currentIndexPage = 0;
  ProductDetailController productDetailController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: widget.imageList?.length ?? 0,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return GestureDetector(
                    onTap: () {
                      widget.onTap?.call(itemIndex);
                      log(itemIndex.toString());
                      log((widget.imageList?.length ?? 0 - 1).toString());
                    },
                    child:
                    CacheImage(
                      height: widget.height,
                      width: widget.width,
                      imageUrl: widget.imageList?[itemIndex],
                      boxFit: widget.boxFit ?? BoxFit.fill,
                    ),
                  );
                },
                options: CarouselOptions(
                    height: widget.height,
                    autoPlay: widget.isAutoPlay ?? false,
                    autoPlayInterval: (widget.isIndicator != 1)
                        ? const Duration(seconds: 3)
                        : const Duration(hours: 1),
                    autoPlayAnimationDuration: (widget.isIndicator != 1)
                        ? const Duration(seconds: 1)
                        : const Duration(hours: 1),
                    enlargeCenterPage: false,
                    viewportFraction: 0.95,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndexPage = index;
                      });
                    })),
            (widget.isIndicator == 1)
                ? Positioned.fill(
              bottom: 12.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:(currentIndexPage == ((widget.imageList?.length ?? 0) - 1)) ? Column(
                //  mainAxisSize: MainAxisSize.max,
                  children: [
                      buildListContact() ,
                    SizedBox(height: height(30),),
                    AnimatedSmoothIndicator(
                      duration: const Duration(milliseconds: 350),
                      activeIndex: currentIndexPage,
                      count: widget.imageList!.length,
                      effect: ExpandingDotsEffect(
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          activeDotColor: Colors.green
                      ),
                      onDotClicked: (index) {
                        carouselController.animateToPage(index,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linear);
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
                    ),
                  ],
                ): AnimatedSmoothIndicator(
                  duration: const Duration(milliseconds: 350),
                  activeIndex: currentIndexPage,
                  count: widget.imageList!.length,
                  effect: ExpandingDotsEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      activeDotColor: Colors.green
                  ),
                  onDotClicked: (index) {
                    carouselController.animateToPage(index,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.linear);
                    setState(() {
                      currentIndexPage = index;
                    });
                  },
                )
              ),
            )
                : Container(
              height: 0,
            ),

          ],
        ),
      ),
    );
  }

  Widget buildListContact (){
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: height(20),),
          buildItemContact("Gọi điện",Icons.phone_in_talk, (){
            productDetailController.callPhone();
          }),
          SizedBox(height: height(10),),
          buildItemContact("Nhắn tin SMS",Icons.sms, (){
            productDetailController.sendSms();
          }),
          SizedBox(height: height(10),),
          buildItemContact("Chat",Icons.message_rounded, (){productDetailController.addChatRoom("");}),
        ],
      ),
    );
  }
  Widget buildItemContact (String tittle, IconData iconData, VoidCallback onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width(120),
        height: width(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, size: size(20),color: greenMoney,),
            SizedBox(width: width(10),),
            Text(tittle, style: AppStyles.textTinyDarkRegular,)
          ],
        ),
      ),
    );

  }
}
