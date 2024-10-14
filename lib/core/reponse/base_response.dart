class BaseResponse<B> {
  final dynamic code;
  final dynamic message;
  final dynamic pagination;
  final dynamic error;
  final B? data;

  BaseResponse(this.code, this.message, this.data, this.pagination, this.error);

  BaseResponse.fromJsonObject(Map<String, dynamic> json,
      {B Function(Map<String, dynamic> bodyJson)? bodyBuilder})
      : code = json["code"],
        message = json["message"],
        pagination = json["pagination"],
        error = json["error"],
        data = json["data"] != null ? bodyBuilder?.call(json["data"]) : null;

  BaseResponse.fromJsonArray(Map<String, dynamic> json,
      {B Function(List<dynamic>)? bodyBuilder})
      : code = json["code"],
        message = json["message"],
        pagination = json["pagination"],
        error = json["error"],
        data = json["data"]  != null ? bodyBuilder?.call(json["data"]) : null;


  BaseResponse.fromJsonPostObject(Map<String, dynamic> json,
      {B Function(dynamic bodyJson)? bodyBuilder})
      : code = json["code"],
        message = json["message"],
        pagination = json["pagination"],
        error = json["error"],
        data = json["data"] != null ? bodyBuilder?.call(json["data"]) : null;

}
