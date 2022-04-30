
import 'package:flutter/material.dart';

import '../../../utils/common/screen_utils.dart';


class SliderVideo extends StatefulWidget {
  const SliderVideo(
      {Key? key,
        this.maxValue,
        this.sliderChangeValue,
        this.isOpenFullScreen,
        this.onOpenFullScreen})
      : super(key: key);
  final maxValue;
  final Function(double value)? sliderChangeValue;
  final bool? isOpenFullScreen;
  final Function()? onOpenFullScreen;
  @override
  State<SliderVideo> createState() => SliderVideoState();
}

/// This is the private State class that goes with MyStatefulWidget.
class SliderVideoState extends State<SliderVideo> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    double tempValue = _currentSliderValue;
    if (_currentSliderValue < 0 || _currentSliderValue > widget.maxValue)
      tempValue = 0;
    return Row(crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 40,
            child: Text(
              _printDuration(Duration(seconds: _currentSliderValue.toInt())),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            height: height(40),
            child: Slider(
              value: tempValue,
              min: 0,
              max: widget.maxValue,
              // divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  widget.sliderChangeValue!(value);
                });
              },
            ),
          ),
        ]);
  }

  playing(value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  // convert duration to format hh:mm:ss
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
