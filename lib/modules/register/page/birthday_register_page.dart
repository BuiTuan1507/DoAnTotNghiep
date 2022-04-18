
import 'package:do_an/modules/modules.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class BirthDayRegisterPage extends StatefulWidget {
  const BirthDayRegisterPage({Key? key}) : super(key: key);

  @override
  State<BirthDayRegisterPage> createState() => _BirthDayRegisterPageState();
}

class _BirthDayRegisterPageState extends State<BirthDayRegisterPage> {

  RegisterController controller = Get.find();
  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
        return buildMaterialDatePicker(context);
      case TargetPlatform.windows:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
        break;
    }
  }
  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.dateTime.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != controller.dateTime.value) {
      controller.dateTime.value = picked;
    }
  }
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {

                if (picked != controller.dateTime.value) {
                  controller.dateTime.value = picked;
                }
              },
              initialDateTime: controller.dateTime.value,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }


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
                child: Text(
                  "Khi nào là sinh nhật bạn ?",
                  style: AppStyles.textLargeGreenSemiBold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width(15), vertical: height(15)),
                margin: EdgeInsets.all(width(5)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: width(1), color: lightDarkHintText.withOpacity(0.4))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text("Ngày "+ controller.dateTime.value.day.toString()+ " tháng "+ controller.dateTime.value.month.toString() + ", "+ controller.dateTime.value.year.toString())
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
