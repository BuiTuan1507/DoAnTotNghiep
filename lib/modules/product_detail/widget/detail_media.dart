

import 'package:do_an/modules/product_detail/widget/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/app_color.dart';

class DetailMedia extends StatelessWidget {
  const DetailMedia({Key? key, this.urlMedia,required this.tag}) : super(key: key);
  final urlMedia;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: black,
        leading: SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            )),
      ),
      backgroundColor: black,
      body: Center(
        child: Hero(
            tag: tag,
            child: Container(
                child: tag.contains('image')
                    ? ClipRRect(
                    child: Image.network(
                      urlMedia.trim(),
                      errorBuilder: (context, ob, s) => Container(
                        child: Text('lỗi tải ảnh'),
                      ),
                    ))
                    :
                VideoPlayerComponent(
                  url: urlMedia,
                )

            )),
      ),
    );
  }
}