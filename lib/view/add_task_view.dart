import 'package:flutter/material.dart';
import 'package:lista_zadan/controller/tasks_controller.dart';
import 'package:lista_zadan/model/datetime_extension.dart';
import 'package:lista_zadan/model/priority.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({required this.controller, super.key});
  final TasksController controller;
  @override
  State<StatefulWidget> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Priority _priority = Priority(priority: PriorityEnum.p1);
  DateTime _dateOfBeginning = DateTime.now();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
        title: Text("Dodaj zadanie"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Zadanie",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: "Opis",
                border: OutlineInputBorder(),
              ),
            ),
            DropdownButtonFormField<Priority>(
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
            Row(
              children: [
                Text("Data rozpoczęcia: ", style: TextStyle(fontSize: 20)),
                TextButton(
                  onPressed: () {
                    setState(() async {
                      _dateOfBeginning =
                          await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2026),
                          ) ??
                          _dateOfBeginning;
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_nameController.text.isNotEmpty) {
            widget.controller.addTask(
              name: _nameController.text,
              description: _descriptionController.text,
              dateOfBeginning: DateTime.now(),
              priority: _priority,
              context: context,
            );
          }
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
    );
  }
}
