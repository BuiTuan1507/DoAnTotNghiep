
import 'package:flutter/services.dart';

import '../utils.dart';


class CurrencyFormatter extends TextInputFormatter{
  static const separator = '.';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String oldValueText = oldValue.text.replaceAll(separator, '');

    String newValueText = newValue.text.replaceAll(separator, '');

    //  if(oldValueText.length > 3) {
    //   oldValueText = oldValueText.substring(0, oldValueText.length - 3);
    // }
    //   if(newValueText.length > 3) {
    //     newValueText = newValueText.substring(0,newValueText.length-3);
    //   }else if(newValueText.length == 3){
    //    return  const TextEditingValue(
    //      text: "",
    //      selection: TextSelection.collapsed(
    //        offset: 0,
    //      ),
    //    );
    //   }

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }
    final chars = newValueText.split('');
    int selectionIndex = newValue.text.length - newValue.selection.extentOffset;
    if (oldValueText != newValueText) {

      ///check neu full so 0
      bool isAllZero = checkIfAllZero(chars);

      String newString = '';
      if(!isAllZero) {
        for (int i = chars.length - 1; i >= 0; i--) {
          if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
            newString = separator + newString;
          }
          newString = chars[i] + newString;
        }
        //  newString = newString + separator + "000";
        //  selectionIndex = 4; /// do dai cua ",000"
      }
      return TextEditingValue(
        text: newString.toString() + Constants.currency ,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }
    else {
      ///check neu full so 0
      bool isAllZero = checkIfAllZero(chars);

      String newString = '';

      if(!isAllZero){
        for (int i = newValue.text.length - 1; i >= 0; i--) {
          if ((newValue.text.length - 1 - i) % 3 == 0 && i != newValue.text.length - 1) {
            newString = separator + newString;
          }
          newString = newValue.text[i] + newString;
        }
        //     selectionIndex = 4;
      }

      return TextEditingValue(
        text: newString.toString() + Constants.currency,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }
  }

  bool checkIfAllZero (List<String> chars){
    for(String character in chars) {
      if(character != "0") {
        return false;
      }
    }
    return true;
  }

}