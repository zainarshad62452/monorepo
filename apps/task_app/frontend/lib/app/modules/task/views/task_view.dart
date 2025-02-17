import 'package:flutter/material.dart';
import 'package:frontend/app/modules/task/controllers/task_controller.dart';
import 'package:get/get.dart';

class TaskScreen extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  final TextEditingController taskController = TextEditingController();

  TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task App")),
      body: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: const InputDecoration(labelText: "Enter task"),
          ),
          ElevatedButton(
            onPressed: () async {
              await controller.addTask(taskController.text);
              taskController.clear();
            },
            child: const Text("Add Task"),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.tasks[index]['title']),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
