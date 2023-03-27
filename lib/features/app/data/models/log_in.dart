class LogIn {
  LogIn({
    required this.mobile,
    required this.password,
    this.deviceName,
  });

  final String mobile;
  final String password;
  final String? deviceName;

  factory LogIn.fromJson(Map<String, dynamic> json) => LogIn(
        mobile: json["mobile"],
        password: json["password"],
        deviceName: json["device_name"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
        "device_name": deviceName,
      };
}
