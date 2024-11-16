import 'package:task_manager_with_getx/data/models/user_model.dart';

class LoginModel {
  String? status;
  UserModel? data;
  String? token;

  LoginModel({this.status, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = UserModel.fromJson(json['data']);
    }
    token = json['token'];
  }
}
