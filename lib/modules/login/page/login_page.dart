
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/common/screen_utils.dart';

class LoginPage extends GetView{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: GoogleFonts.sarabun(
            fontSize: size(16)
        ),),
      ),
      body: const Center(
        child: Text("Hello"),
      ),
    );
  }

}
