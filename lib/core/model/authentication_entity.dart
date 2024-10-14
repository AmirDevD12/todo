class AuthInfo {
  final String phone;
  final String access;
  final String refresh;

  AuthInfo(
      {required this.phone, required this.access, required this.refresh});

  factory AuthInfo.fromJson(Map<String, dynamic> json) => AuthInfo(
        phone: json["phone_number"],
        access: json["access"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phone,
        "access": access,
        "refresh": refresh,
      };
}
