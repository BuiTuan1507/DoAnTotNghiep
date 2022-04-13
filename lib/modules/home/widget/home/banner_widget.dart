import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/widget/cache_image.dart';

class BannerWidget extends StatefulWidget {
  final List<String>? imageList;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final int? isIndicator;
  final bool? isAutoPlay;
  final Function(int index)? onTap;
  const BannerWidget(
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
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  CarouselController carouselController = CarouselController();
  var currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.imageList == null || widget.imageList!.isEmpty) {
      return Container();
    }
    return Container(
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
                    },
                    child: CacheImage(
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
              bottom: 4.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSmoothIndicator(
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

///swiper

}
