import 'package:do_an/modules/modules.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes_link.dart';
import '../../../utils/utils.dart';
import '../widget/have_account_widget.dart';

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
              SizedBox(
                height: height(10),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width(15), vertical: height(10)),
                margin: EdgeInsets.symmetric(
                    horizontal: width(20), vertical: height(10)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: width(1),
                        color: lightDarkHintText.withOpacity(0.4))),
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text("Ngày " +
                          controller.dateTime.value.day.toString() +
                          " tháng " +
                          controller.dateTime.value.month.toString() +
                          ", " +
                          controller.dateTime.value.year.toString())),
                      Container(
                        // padding: EdgeInsets.only(right: width(20)),
                        child: Icon(
                          Icons.arrow_drop_down_outlined,
                          size: size(25),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height(20),
              ),
              Obx(()=> Column(
                children: controller.listSexType
                    .map((element) => buildContainerSex(
                    tittle: element.tittle!,
                    isSelected: element.isSelected!))
                    .toList(),
              )),
              SizedBox(
                height: height(40),
              ),
              buttonNext(),
              haveAccount()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainerSex({required String tittle, required bool isSelected}) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tittle,
                style: AppStyles.textSmallGreenRegular,
              ),
              InkWell(
                onTap: () {
                  controller.changeStateSexType(tittle);
                },
                child: Container(
                  height: width(17),
                  width: width(17),
                  margin: EdgeInsets.all(height(1)),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: width(1.5), color: greenMoney)),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.white, width: width(2)),
                        shape: BoxShape.circle,
                        color: (isSelected) ? greenMoney : Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height(10),
          ),
          Divider(
            indent: width(0),
            endIndent: width(0),
            thickness: width(1),
            color: lightDarkHintText.withOpacity(0.3),
          )
        ],
      ),
    );
  }
  Widget buttonNext(){
    void toPage(){
      Get.toNamed(RouterLink.registerTermCondition);
    }
    return ButtonApply(
      tittle: "Tiếp theo",
      style: AppStyles.textNormalWhiteSemiBold,
      onClick: toPage,
      width: double.infinity,
      height: height(55),
      margin: EdgeInsets.symmetric(horizontal: width(20), vertical: height(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: greenMoney),
    );
  }
}
