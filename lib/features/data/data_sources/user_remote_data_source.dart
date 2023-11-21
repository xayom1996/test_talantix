import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_talantix/features/data/models/user.dart';

class UserRemoteDataSource {
  UserRemoteDataSource();

  Future<List<User>> getUsers() async {
    final http.Response response = await http.get(Uri.parse(''));
    return json.decode(response.body);
  }
}
