import 'package:flutter/material.dart';
import 'package:lista_zadan/controller/tasks_controller.dart';
import 'package:lista_zadan/model/datetime_extension.dart';
import 'package:lista_zadan/model/task.dart';
import 'package:lista_zadan/model/priority.dart';

class TaskView extends StatefulWidget {
  const TaskView({required this.controller, required this.task, super.key});
  final TasksController controller;
  final Task task;
  @override
  State<StatefulWidget> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _dateOfBeginning = DateTime.now();
  Priority _priority = Priority.p1();
  bool _editing = false;
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.task.name;
    _descriptionController.text = widget.task.description ?? "";
    _priority = widget.task.priority;
    _dateOfBeginning = widget.task.dateOfBeginning;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            widget.controller.showTasks(context: context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Szczegóły"),
        backgroundColor: Colors.blueGrey,
        actions: [
          TextButton(
            onPressed: () {
              widget.controller.deleteTask(task: widget.task, context: context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Usuń", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              readOnly: !_editing,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Zadanie",
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              readOnly: !_editing,
              controller: _descriptionController,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: "Opis",
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
              ),
            ),
            Visibility(
              visible: _editing,
              child: DropdownButtonFormField<Priority>(
                value: _priority,
                decoration: InputDecoration(
                  labelText: 'Wybierz priorytet',
                  border: OutlineInputBorder(),
                ),
                items: Priority.allOptions().map((p) {
                  return DropdownMenuItem(value: p, child: Text(p.toString()));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _priority = value ?? _priority;
                  });
                },
              ),
            ),
            Visibility(
              visible: !_editing,
              child: Row(
                children: [
                  Text("Priorytet: ", style: TextStyle(fontSize: 20)),
                  Text(
                    _priority.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _editing,
              child: Row(
                children: [
                  Text("Data rozpoczęcia: ", style: TextStyle(fontSize: 20)),
                  TextButton(
                    onPressed: () async {
                      final picked =
                          await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2026),
                          ) ??
                          _dateOfBeginning;
                      setState(() {
                        _dateOfBeginning = picked;
                      });
                    },
                    child: Text(
                      _dateOfBeginning.toUi(),
                      softWrap: false,
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !_editing,
              child: Row(
                children: [
                  Text("Data Rozpoczęcia: ", style: TextStyle(fontSize: 20)),
                  Text(
                    _dateOfBeginning.toUi(),
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_editing) {
            if (_nameController.text.isNotEmpty) {
              widget.controller.editTast(
                oldTask: widget.task,
                name: _nameController.text,
                description: _descriptionController.text,
                dateOfBeginning: _dateOfBeginning,
                priority: _priority,
                context: context,
              );
            }
          } else {
            setState(() {
              _editing = true;
            });
          }
        },
        child: (_editing) ? Text("Zapisz") : Text("Edytuj"),
      ),
    );
  }
}
