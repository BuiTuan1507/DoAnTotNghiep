import 'package:get/get.dart';

import '../../../models/register/sex_type.dart';

class BirthdayRegisterController extends GetxController{
  Rx<DateTime> dateTime = DateTime.now().obs;

  RxBool termCondition = false.obs;

  RxList<SexType> listSexType  = SexType.listSexType.obs;



  bool firstSelectedTime = false;

  bool firstSelectedSex = false;

  RxBool isCheckSelectedSex = false.obs;

  DateTime checkTime = DateTime(DateTime.now().year -13, DateTime.now().month, DateTime.now().day);

  void changeTermCondition (bool? value){
    termCondition.value = value ?? false;
  }

  void changeStateSexType(String name){
    int index = listSexType.indexWhere((element) => element.tittle == name);
    if(index == -1) return;
    for (var element in listSexType) {
      element.isSelected = false;
    }
    listSexType[index].isSelected = true;
    listSexType.refresh();
    isCheckSelectedSex.value = true;
  }
}