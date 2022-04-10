import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class ButtonApply extends StatefulWidget {
 final String? tittle;
 final double? height;
 final double? width;
 final HexColor? color;
 final VoidCallback onClick;
 final EdgeInsets? padding;
 final EdgeInsets? margin;
 final TextStyle? style;
 final BoxDecoration? decoration;
   const ButtonApply({
     Key? key,
     this.tittle, this.height, this.width, this.color,required this.onClick,
     this.padding, this.margin, this.style, this.decoration
   }) : super(key: key);

  @override
  _ButtonApplyState createState() => _ButtonApplyState();
}

class _ButtonApplyState extends State<ButtonApply> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin ?? EdgeInsets.all(width(0)),
      padding: widget.padding ?? EdgeInsets.all(width(0)),
      decoration: widget.decoration,
      child: InkWell(
        onTap: () async {
          widget.onClick();
        },
        child: Center(
          child: Text(widget.tittle ?? "", style: widget.style),
        ),
      ),
    );
  }
}
