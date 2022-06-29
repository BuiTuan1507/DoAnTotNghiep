
 // const baseUrl = "http://10.0.2.2:8088";
 const baseUrl = "https://6df9-42-115-113-141.ap.ngrok.io";

 //const baseUrl = "http://doanserver-env.eba-r5zsksr3.ap-southeast-1.elasticbeanstalk.com";
class ProdAppChatEnvironment{

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
  static const String getListPostPersonal = "/get_list_post_personal";
  static const String getListPostNoFilter = "/get_list_post_no_filter";
  static const String getListPostFilter = "/get_list_post_filter";
  static const String getListPostSearch = "/search_post";
  static const String getListHistorySearch = "/get_list_history_search_post";
  static const String deleteHistorySearch = "/delete_list_history_search_post";
  static const String getDetailPost = "/get_detail_post";
  static const String reportPost = "/report_post";
  static const String followUser = "/follow_user";
  static const String getListFriends = "/get_list_friends";
  static const String getAnotherUserInfo = "/get_another_user_info";
  static const String likePost = "/like_post";
  static const String unlikePost = "/unlike_post";
  static const String checkToken = "/check_token";
  static const String extendPost = "/extend_post";
  static const String cancelPost = "/cancel_post";
  static const String buyPost = "/buy_post";
  static const String sellPost = "/sell_post";
  static const String ratingPost = "/rating_post";
  static const String getListNotificationPost = "/get_list_notification";
  static const String readNotification = "/read_notification";
  static const String getSettingInfo = "/get_info_setting";
  static const String addChatRoom = "/add_chat_room";
  static const String getListChatRoom = "/get_list_chat_room";
  static const String getDetailChatRoom = "/get_detail_chat_room";
  static const String getListMessage = "/get_list_message";
  static const String deleteChatRoom = "/delete_chat_room";
  static const String searchChatRoom = "/search_chat_room";
  static const String getListPostSell = "/get_list_post_sell";
  static const String getListPostBuy = "/get_list_post_buy";
  static const String getListPostLike = "/get_list_post_like";
}