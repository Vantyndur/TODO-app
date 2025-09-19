import 'package:flutter/material.dart';
import '../controller/tasks_controller.dart';

class TasksView extends StatefulWidget {
  const TasksView({required this.controller, super.key});
  final TasksController controller;
  @override
  State<StatefulWidget> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista zadań"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: widget.controller.tasks.length,
        itemBuilder: (context, index) {
          final task = widget.controller.tasks[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: widget.controller.getPriorityColor(task: task),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              title: Text(task.name),
              onTap: () {
                widget.controller.showDetails(context: context, index: index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.controller.goToAddTask(context: context);
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
    );
  }
}
