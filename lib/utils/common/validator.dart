

class Validator {
  Validator();

  static String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.email';
    } else {
      return "";
    }
  }

  static String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.password';
    } else {
      return null;
    }
  }

  static bool? name(String? value) {
    if(value == "") return false;
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value!)) {
      return true;
    } else {
      return false;
    }
  }

  static String? number(String? value) {
    String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.number';
    } else {
      return "";
    }
  }

  static String? amount(String? value) {
    String pattern = r'^\d+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.amount';
    } else {
      return "";
    }
  }

 static String? notEmpty(String? value) {
    String pattern = r'^\S+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.notEmpty';
    } else {
      return "";
    }
  }

  static bool validationPhone(String value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,11}$)';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) return false;
    return true;
  }

  static bool isCheckLowercase(String password) {
    bool isCheckPassword;
    RegExp regEx = RegExp(r'[a-z]');
    isCheckPassword = regEx.hasMatch(password);
    return isCheckPassword;
  }

  static bool isCheckUppercase(String password) {
    bool isCheckPassword;
    RegExp regEx = RegExp(r'[A-Z]');
    isCheckPassword = regEx.hasMatch(password);
    return isCheckPassword;
  }

  static bool isCheckContainSpecialKey(String password) {
    bool isCheckContainPass;
    RegExp regEx = RegExp(r"(?=.*?[!@#$%^&*])");
    isCheckContainPass = regEx.hasMatch(password);
    return isCheckContainPass;
  }

  static bool isCheckContainPasswordNumber(String password) {
    bool isCheckContainPass;
    RegExp regEx = RegExp(r'[0-9]');
    isCheckContainPass = regEx.hasMatch(password);
    return isCheckContainPass;
  }
}
