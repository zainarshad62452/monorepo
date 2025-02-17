import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';

List<Map<String, dynamic>> tasks = [
  {'title': 'Dummy Task 1'},
  {'title': 'Dummy Task 2'},
  {'title': 'Dummy Task 3'},
];

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final body = await context.request.body();
    final task = jsonDecode(body) as Map<String, dynamic>;
    tasks.add(task);
    return Response.json(body: {'message': 'Task added successfully'});
  }
  return Response.json(body: tasks);
}
