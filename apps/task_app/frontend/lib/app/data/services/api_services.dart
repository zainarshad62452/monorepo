import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'http://127.0.0.1:8080';

  Future<List<Map<String, dynamic>>> fetchTasks() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> addTask(Map<String, dynamic> task) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add task');
    }
  }
}
