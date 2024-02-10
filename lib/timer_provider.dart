import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_sm/task_model.dart';

class TimerProvider with ChangeNotifier {
  List<Task> tasks = [];
  late Timer timer;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void startTask(int index) {
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updateTaskDuration(index);
    });
    tasks[index].isActive = true;
    notifyListeners();
  }

  void pauseTask(int index) {
    tasks[index].isActive = false;
    notifyListeners();
  }

  void resetTask(int index) {
    tasks[index].duration = 0;
    tasks[index].isActive = false;
    notifyListeners();
  }

  void updateTaskDuration(int index) {
    if (tasks[index].isActive) {
      tasks[index].duration++;
      notifyListeners();
    }
  }
}
