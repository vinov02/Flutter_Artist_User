import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:artist_community_user/Services/globals.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(
      String name, String email, String password, String mobile,String confirmPassword) async {
    Map data = {
      "name":name,
      "email":email,
      "mobile":mobile,
      "password":password,
      "confirm_password":confirmPassword
    };
    var body = json.encode(data);
    var url = Uri.parse('$baseURL/user/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }
  static Future<http.Response> login(
      String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse('$baseURL/user/login');
    http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/json','Accept':'application/json'},
      body: body,
    );
    return response;
  }
}
