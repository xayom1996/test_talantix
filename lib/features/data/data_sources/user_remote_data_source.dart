import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_talantix/features/data/models/user.dart';

class UserRemoteDataSource {
  UserRemoteDataSource();

  Future<List<User>> getUsers() async {
    final http.Response response = await http.get(Uri.parse('https://my-json-server.typicode.com/xayom1996/test_talantix/users'));
    final data = jsonDecode(response.body) as List<dynamic>;
    return data.map((user) => User.fromJson(user)).toList();
  }
}
