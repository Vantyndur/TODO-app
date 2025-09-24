import 'package:lista_zadan/model/datetime_extension.dart';

import 'package:lista_zadan/model/priority.dart';

class Task {
  Task({
    this.id,
    required this.name,
    this.description,
    required this.dateOfBeginning,
    required this.priority,
  });
  int? id;
  String name;
  String? description;
  DateTime dateOfBeginning;
  Priority priority;
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'dateOfBeginning': dateOfBeginning.toDb(),
      'priority': priority.toString(),
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, name: $name, description: $description,dateOfBeginning: ${dateOfBeginning.toDb()} ,priority: ${priority.toString()}}';
  }
}
