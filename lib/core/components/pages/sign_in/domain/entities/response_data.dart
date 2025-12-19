/*
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ResponseData {
  final String username;
  final String password;
  final String name;
  final int age;
  final String email;

  const ResponseData({
    required this.username,
    required this.password,
    required this.name,
    required this.age,
    required this.email,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

  // اعتبارسنجی داده‌ها
  bool isValid() {
    return username.isNotEmpty &&
        password.length >= 6 &&
        name.isNotEmpty &&
        age > 0 &&
        _isValidEmail(email);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // تبدیل به User (بدون فیلدهایی که سرور باید مقدار دهد)
  Map<String, dynamic> toUserJson() {
    return {
      'username': username,
      'password': password,
      'name': name,
      'age': age,
      'email': email,
    };
  }
}*/
