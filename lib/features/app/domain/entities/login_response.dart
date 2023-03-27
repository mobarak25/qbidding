class LogInResponse {
  LogInResponse({
    this.error,
    this.timezone,
    this.timezoneOffset,
    this.version,
    this.id,
    this.token,
  });

  final int? error;
  final dynamic timezone;
  final dynamic timezoneOffset;
  final String? version;
  final int? id;
  final String? token;

  factory LogInResponse.fromJson(Map<String, dynamic> json) => LogInResponse(
        error: json["error"],
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        version: json["version"],
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "version": version,
        "id": id,
        "token": token,
      };
}
