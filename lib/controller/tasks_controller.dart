import 'package:flutter/material.dart';
import 'package:lista_zadan/view/task_view.dart';
import 'package:lista_zadan/view/tasks_view.dart';
import 'package:lista_zadan/model/task.dart';
import 'package:lista_zadan/model/priority.dart';
import 'package:lista_zadan/view/add_task_view.dart';
import 'package:lista_zadan/controller/database_controller.dart';

class TasksController {
  final DatabaseController _db = DatabaseController.instance;
  int highestId = 0;
  List<Task> tasks = [];

  /// Return home page - TasksView
  FutureBuilder home() {
    Future<List<Task>> data = _db.tasks();
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is loading
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // If the future completed with an error
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          // If the future completed successfully
          tasks = snapshot.data;
          for (var task in tasks) {
            if (task.id != null) {
              if (task.id! > highestId) {
                highestId = task.id!;
              }
            }
          }
          return TasksView(controller: this);
        } else {
          // If the future is null or has no data
          return const Center(child: Text("No data found"));
        }
      },
    );
  }

  /// Redirect to add new task
  void goToAddTask({required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AddTaskView(controller: this)),
    );
  }

  /// redirect to tasks
  void showTasks({required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => home()),
    );
  }

  /// Adds Task to tasks
  void addTask({
    required String name,
    required String description,
    required DateTime dateOfBeginning,
    required Priority priority,
    required BuildContext context,
  }) {
    try {
      highestId = highestId+1;
      Task task = Task(
        // id: highestId,
        name: name,
        description: description,
        dateOfBeginning: dateOfBeginning,
        priority: priority,
      );
      _db.insertTask(task);
      showTasks(context: context);
    } catch (e) {
      throw Exception("Wrong parameters passed!");
    }
  }

  /// Edit given task
  void editTast({
    required Task oldTask,
    required String name,
    required String description,
    required DateTime dateOfBeginning,
    required Priority priority,
    required BuildContext context,
  }) {
    try {
      final Task task = oldTask;
      task.name = name;
      task.description = description;
      task.dateOfBeginning = dateOfBeginning;
      task.priority = priority;
      _db.updateTask(task);
      showTasks(context: context);
    } catch (e) {
      throw Exception("Update task error");
    }
  }

  /// Deletes given task
  void deleteTask({required Task task, required BuildContext context}) {
    try {
      if (task.id != null) {
        _db.deleteTask(task.id!);
      }
      showTasks(context: context);
    } catch (e) {
      throw Exception("Delete task error");
    }
  }

  /// Returns tile color acording to task priority
  Color? getPriorityColor({required Task task}) {
    Color? color = Colors.red;
    switch (task.priority.toString()) {
      case "1":
        color = Colors.white;
        break;
      case "2":
        color = Colors.green[300];
        break;
      case "3":
        color = Colors.blue[400];
        break;
    }
    return color;
  }

  /// Redirect to task details
  void showDetails({required BuildContext context, required int index}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TaskView(task: tasks[index], controller: this),
      ),
    );
  }
}
