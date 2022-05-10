
class ProdAppChatEnvironment{
//  final baseUrl = "http://10.0.2.2:8088";
final baseUrl = "https://ba4e-58-187-180-109.ap.ngrok.io";
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
}