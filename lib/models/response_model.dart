class ResponseModel {
  bool status;
  String message;
  int? errorCode;
  dynamic error;
  dynamic data ;

  ResponseModel({
    this.status = false,
    this.message = "",
    this.errorCode = 0,
    this.error,
    this.data
  });

  factory ResponseModel.fromJson(Map<String, dynamic> jsonObject) {
    return ResponseModel(
      status: jsonObject["status"] as bool,
      message: jsonObject["message"],
      errorCode: jsonObject["errorCode"] == null ? null : jsonObject["message"],
      error: jsonObject["error"],
      data: jsonObject["data"],
    );
  }
}
