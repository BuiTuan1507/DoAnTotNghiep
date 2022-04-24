
import 'package:do_an/config/config.dart';
import 'package:do_an/modules/splash/bindings/root_bindings.dart';
import 'package:do_an/utils/common/web_socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/routers.dart';
import 'modules/login/bindings/login_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MyWebSocket());
  runApp(
    const MyApp(),
  );
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
        ));
  }
}


