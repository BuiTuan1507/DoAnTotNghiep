import 'package:flutter/material.dart';

class SuccessToast extends StatefulWidget {
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String message;
  final int duration;
  final VoidCallback? onToasted;

  const SuccessToast(
      {Key? key,
        this.backgroundColor = ToastColors.successToastBGColor,
        this.textStyle = ToastTextStyle.defaultTextStyle,
        this.message = " ",
        this.duration = 2,
        this.onToasted})
      : super(key: key);

  @override
  _SuccessToastState createState() => _SuccessToastState();
}

class _SuccessToastState extends State<SuccessToast>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fadeAnimation;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
        duration: Duration(seconds: 2), vsync: this);
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Curves.easeInCirc,
        reverseCurve: Curves.easeOutCirc,
        parent: _fadeController));

    _initAnimation();
  }

  void _initAnimation() async {
    _fadeController.forward();
    await Future.delayed(Duration(milliseconds: widget.duration));
    _fadeController.reverse();
    if (widget.onToasted != null) widget.onToasted!();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Material(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        color: widget.backgroundColor,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: widget.textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToastColors {
  static const defaultToastBGColor = Color(0xff666666);
  static const defaultToastTextColor = Colors.white;
  static const infoToastBGColor = Color(0xff1CAEFA);
  static const errorToastBGColor = Color(0xffFB2F49);
  static const warningToastBGColor = Color(0xffFFAB00);
  static const successToastBGColor = Color(0xff3ECA66);
}

class ToastTextStyle {
  static const TextStyle defaultTextStyle =
  TextStyle(color: ToastColors.defaultToastTextColor);
}