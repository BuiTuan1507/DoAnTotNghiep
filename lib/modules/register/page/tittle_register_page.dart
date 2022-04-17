import 'package:do_an/config/config.dart';
import 'package:do_an/utils/common/screen_utils.dart';
import 'package:do_an/utils/theme/app_styles.dart';
import 'package:do_an/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TittleRegisterPage extends StatefulWidget {
  const TittleRegisterPage({Key? key}) : super(key: key);

  @override
  State<TittleRegisterPage> createState() => _TittleRegisterPageState();
}

class _TittleRegisterPageState extends State<TittleRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height(120),
              ),
              Center(
                child: Text("Tham gia chợ Bách Khoa",style: AppStyles.textLargeGreenSemiBold,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height(20),bottom: height(70)),
                child: Center(
                  child: Text("Chúng tôi sẽ giúp bạn tạo tài khoản sau vài bước dễ dàng", style: AppStyles.textSmallDarkRegular,),
                ),
              ),
              buttonNext(),
              Padding(
                padding: EdgeInsets.only(top: height(70)),
                child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Center(
                    child: Text(
                      "Bạn đã có tài khoản", style: AppStyles.textSmallGreenRegular,
                    ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
  Widget buttonNext(){
    void toPage(){
      Get.toNamed(RouterLink.registerNamePage);
    }
    return ButtonApply(
      tittle: "Bắt đầu",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: toPage,
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: greenMoney),
    );;
  }

}
