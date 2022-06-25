import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

class SearchChatWidget extends StatefulWidget {

  final Function(String text) onChanged;
  final TextEditingController textEditingController;

  const SearchChatWidget({
    Key? key, required this.onChanged, required this.textEditingController
  }) : super(key: key);

  @override
  _SearchChatWidgetState createState() => _SearchChatWidgetState();
}

class _SearchChatWidgetState extends State<SearchChatWidget> {
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border =
    OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: grey_4,width: height(1)
        )
    );
    return Container(
        height: height(60),
        padding: EdgeInsets.symmetric(vertical: height(3)),
        margin: EdgeInsets.symmetric(vertical: height(10)),
        child: TextFormField(
            controller: widget.textEditingController,
            onChanged: (text) {
              setState(() {
                widget.onChanged(text);
              });
            },
            decoration: InputDecoration(

              border: border,
              focusedBorder: border,
              enabledBorder: border,
              disabledBorder: border,
              hintText: 'Tìm kiếm chat ...',
              alignLabelWithHint: false,
              hintStyle: GoogleFonts.sarabun(fontSize: size(14), color: greenMoney),
              prefixIcon:  Icon(Icons.search, color: greenMoney, size: 20),
              suffixIcon: !widget.textEditingController.text.isNotEmpty? null: buildIconButton(),
              contentPadding:  EdgeInsets.all(width(8)),
            )
        )
    );
  }
  Widget buildIconButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            widget.textEditingController.text = "";
            widget.onChanged("");
          });
        },
        icon: const Icon(Icons.close, color: Colors.grey, size: 18,)
    );
  }
}
