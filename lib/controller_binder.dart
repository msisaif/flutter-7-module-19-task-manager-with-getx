import 'package:get/get.dart';
import 'package:task_manager_with_getx/ui/controllers/cancelled_task_list_controller.dart';
import 'package:task_manager_with_getx/ui/controllers/completed_task_list_controller.dart';
import 'package:task_manager_with_getx/ui/controllers/new_task_list_controller.dart';
import 'package:task_manager_with_getx/ui/controllers/progress_task_list_controller.dart';
import 'package:task_manager_with_getx/ui/controllers/sign_in_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(NewTaskListController());
    Get.put(CompletedTaskListController());
    Get.put(CancelledTaskListController());
    Get.put(ProgressTaskListController());
  }
}
