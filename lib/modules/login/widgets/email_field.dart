import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import '../../modules.dart';

class BuildTextEmailField extends StatefulWidget {

  final Function(String text) onChanged;
  final TextEditingController textEditingController;
  final String tittle;
  final String hintText;

  const BuildTextEmailField({Key? key, required this.onChanged,required this.textEditingController, required this.tittle, required this.hintText}) : super(key: key);

  @override
  State<BuildTextEmailField> createState() => _BuildTextEmailFieldState();
}

class _BuildTextEmailFieldState extends State<BuildTextEmailField> {
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width(16), bottom: height(12)),
          child: Text(
            widget.tittle,
            style: GoogleFonts.sarabun(
                fontSize: size(16),
                fontWeight: FontWeight.w600,
                color: dark),
          ),
        ),
        Container(
            height: height(70),
            padding: EdgeInsets.only(
                left: width(16), bottom: height(12), right: width(16)),
            child: TextFormField(
              controller: widget.textEditingController,
              maxLines: 1,
              onChanged: (text) {
                setState(() {
                  widget.onChanged(text);
                });
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppStyles.textSmallDarkNormal,
                contentPadding: EdgeInsets.symmetric(horizontal: width(16)),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: lightDarkHintText, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: greenMoney, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: lightDarkHintText, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                prefixIcon:  Icon(Icons.phone, color: greenMoney, size: size(20)),
                suffixIcon: !widget.textEditingController.text.isNotEmpty? null: buildIconButton(),
              ),
            )
        )
      ],
    );
  }

  Widget buildIconButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            widget.textEditingController.text = "";
          });
        },
        icon: const Icon(Icons.close, color: Colors.grey, size: 18,)
    );
  }
}


/*
Widget buildTextEmailField(
    {required String tittle,
      required TextEditingController textEditingController,
      required String hintText
      }) {

  return
}

 */

