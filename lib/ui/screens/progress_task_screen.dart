import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_with_getx/ui/controllers/progress_task_list_controller.dart';
import 'package:task_manager_with_getx/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_with_getx/ui/widgets/snack_bar_message.dart';
import 'package:task_manager_with_getx/ui/widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  final ProgressTaskListController _progressTaskListController =
  Get.find<ProgressTaskListController>();

  @override
  void initState() {
    super.initState();
    _getProgressTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _getProgressTaskList();
        },
        child: GetBuilder<ProgressTaskListController>(
          builder: (controller) {
            return Visibility(
              visible: !controller.inProgress,
              replacement: const CenteredCircularProgressIndicator(),
              child: ListView.separated(
                itemCount: controller.taskList.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    taskModel: controller.taskList[index],
                    onRefreshList: _getProgressTaskList,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _getProgressTaskList() async {
    final bool result = await _progressTaskListController.getProgressTaskList();
    if (result == false) {
      showSnackBarMessage(
        context,
        _progressTaskListController.errorMessage!,
        true,
      );
    }
  }
}
