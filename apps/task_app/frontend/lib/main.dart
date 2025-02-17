import 'package:flutter/material.dart';
import 'package:frontend/app/modules/task/views/task_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: TaskScreen(),
    );
  }
}