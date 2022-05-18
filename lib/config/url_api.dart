
class ProdAppChatEnvironment{
  final baseUrl = "http://10.0.2.2:8088";
//final baseUrl = "https://ad30-58-187-180-109.ap.ngrok.io";
  final baseApi = "/api";
  final baseVersion = "";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;

  String get domainApi => "$baseUrl$baseApi$baseVersion";
}

final appEnvironment = ProdAppChatEnvironment();

class UrlApi{
  static const login = "/login";
  static const logout = "/logout";
  static const String register = "/signup";
  static const String getUserInfo = "/get_user_info";
  static const String setUserInfo = "/set_user_info";
  static const String  changePassword = "/change_password";
  static const String addAddress = "/add_address";
  static const String deleteAddress = "/delete_address";
  static const String getListProvince = "/get_list_address";
  static const String getListDistrict = "/get_list_district";
  static const String getListWard = "/get_list_ward";
  static const String changeAddress = "/change_address";
  static const String getListMainCategory = "/get_list_main_category";
  static const String getListSubcategory = "/get_list_sub_category";
  static const String addPost = "/add_post";
}