import 'package:do_an/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetView<ProductDetailController>{
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Product detail"),
    );
  }

}