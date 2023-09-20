class FormattedResponse {
  final bool success;
  final bool? deviceRegistered;
  final dynamic data;
  final String? responseCodeError;
  final int? statusCode;

  FormattedResponse({
    required this.success,
    this.deviceRegistered,
    this.data,
    this.responseCodeError,
    this.statusCode,
  });
}

// @JsonEnum()
// enum StatusCode {
//   @JsonValue(200)
//   success,
//   @JsonValue(301)
//   movedPermanently,
//   @JsonValue(302)
//   found,
//   @JsonValue(500)
//   internalServerError,
// }
