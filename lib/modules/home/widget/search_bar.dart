import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';

class SearchBar extends StatefulWidget {

  final Function(String text) onChanged;
  final TextEditingController textEditingController;

  const SearchBar({
    Key? key, required this.onChanged, required this.textEditingController
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border =
    OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        borderSide: BorderSide(color: Colors.green,width: width(1)));
    return Container(
        height: height(50),
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        margin: EdgeInsets.symmetric(vertical: height(10)),
        color: Colors.white,
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
              hintText: 'Tìm kiếm giao dich ...',
              alignLabelWithHint: false,
              hintStyle: GoogleFonts.sarabun(fontSize: size(14), color: violet),
              prefixIcon:  Icon(Icons.search, color: violet, size: 20),
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
