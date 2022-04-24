import 'package:flutter/cupertino.dart';
import '../utils.dart';

Widget loadingLogin(bool isLoading) {
  return Visibility(
      visible: isLoading,
      child: Container(
        padding: EdgeInsets.only(bottom: height(20)),
        alignment: Alignment.bottomCenter,
        child: const CupertinoActivityIndicator(),
      )
  );
}
