
class ProdAppChatEnvironment{
  final baseUrl = "";
  final baseApi = "/api";
  final baseVersion = "";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;

  String get domainApi => baseUrl;
}

final appEnvironment = ProdAppChatEnvironment();

class UrlApi{


}