
import 'dart:io';

import 'package:do_an/config/config.dart';
import 'package:do_an/modules/splash/bindings/root_bindings.dart';
import 'package:do_an/utils/common/web_socket.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'utils/widget/loading_toast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Firebase.initializeApp();
  Get.put(MyWebSocket());
  runApp(
    const MyApp(),
  );
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Loading(
            child: GetMaterialApp(
              enableLog: true,
              debugShowCheckedModeBanner: false,
              title: 'Market',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialBinding: RootBinding(),
              initialRoute: RouterLink.splash,
              getPages: AppRouters.createRoutes(),
            ),
          ),
        ));
  }
}


