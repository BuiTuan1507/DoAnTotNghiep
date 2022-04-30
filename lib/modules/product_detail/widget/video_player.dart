
import 'package:do_an/modules/product_detail/widget/slider_video.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/common/screen_utils.dart';
import '../../../utils/constants/app_image.dart';
import '../../../utils/theme/app_color.dart';

class VideoPlayerComponent extends StatefulWidget {
  const VideoPlayerComponent(
      {Key? key, this.url, this.isOpenFullScreen, this.onOpenFullScreen})
      : super(key: key);
  final url;
  final bool? isOpenFullScreen;
  final Function()? onOpenFullScreen;
  @override
  _VideoPlayerComponentState createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  VideoPlayerController videoPlayerController =
  VideoPlayerController.network('');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initVideo();
  }

  double currentTime = 0;
  bool isVideoPlaying = false;
  GlobalKey<SliderVideoState> sliderVideoKey = GlobalKey();
  initVideo() {
    videoPlayerController = VideoPlayerController.network(widget.url,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    videoPlayerController.setVolume(20);
    videoPlayerController.addListener(() {
      // to run slider video
      if (videoPlayerController.value.position.inSeconds.toDouble() > 0)
        currentTime = videoPlayerController.value.position.inSeconds.toDouble();
      if (sliderVideoKey.currentState != null)
        sliderVideoKey.currentState?.playing(currentTime);
    });
    videoPlayerController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (sliderVideoKey.currentState != null)
          isVideoPlaying
              ? videoPlayerController.pause()
              : videoPlayerController.play();
        setState(() {
          isVideoPlaying = !isVideoPlaying;
        });
      },
      child: Container(
        color: grey_8,
        height: height(250),
        //width: width(300),
        child: Stack(
          children: [
            VideoPlayer(videoPlayerController),
            isVideoPlaying == false
                ? Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(MyImage.play),
            )
                : Container(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(bottom: height(10)),
                height: height(20),
                child: SliderVideo(
                  onOpenFullScreen: () {
                    this.videoPlayerController.pause();
                    widget.onOpenFullScreen!();
                  },
                  key: sliderVideoKey,
                  isOpenFullScreen: widget.isOpenFullScreen,
                  maxValue:
                  videoPlayerController.value.duration.inSeconds.toDouble(),
                  sliderChangeValue: (value) {
                    videoPlayerController.seekTo(Duration(
                        seconds: value.toInt() > 0 ? value.toInt() : 0));
                  },
                ),
              ),
            ),
            widget.isOpenFullScreen == false
                ? Align(
              alignment: Alignment.bottomRight,
              child: Container(
                //color: Colors.amber,
                height: height(40),
                child: InkWell(
                  onTap: widget.onOpenFullScreen,
                  child: Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                  ),
                ),
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }
}
