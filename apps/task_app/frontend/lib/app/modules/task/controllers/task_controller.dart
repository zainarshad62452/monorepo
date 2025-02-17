import 'package:frontend/app/data/services/api_services.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final ApiService _apiService = ApiService();
  var tasks = <Map<String, dynamic>>[].obs;

  @override
  Future<void> onInit() async {
   await fetchTasks();
    super.onInit();
  }

  Future<void> fetchTasks() async {
    tasks.value = await _apiService.fetchTasks();
  }

  Future<void> addTask(String title) async {
    await _apiService.addTask({'title': title});
    fetchTasks();
  }
}
