import 'package:flutter_test/flutter_test.dart';
import 'package:lista_zadan/model/task.dart';
import 'package:lista_zadan/model/priority.dart';
import 'package:lista_zadan/model/datetime_extension.dart';

void main() {
  group("Task -", () {
    group("Constructor -", () {
      test("Should create an instance with all parameters provided.", () {
        // GIVEN
        final int id = 0;
        final String name = "name";
        final String description = "description";
        final DateTime dateOfBeginning = DateTime.now();
        final Priority priority = Priority.p1(); //TODO: CREATE MOCK
        // WHEN
        final obj = Task(
          id: id,
          name: name,
          description: description,
          dateOfBeginning: dateOfBeginning,
          priority: priority,
        );
        // THEN
        expect(obj, isA<Task>());
        expect(obj.id, id);
        expect(obj.name, name);
        expect(obj.description, description);
        expect(obj.dateOfBeginning, dateOfBeginning);
        expect(obj.priority, isA<Priority>());
        expect(obj.priority, priority);
      });
      test(
        "Should create an instance with all parameters provided except id and description.",
        () {
          // GIVEN
          final String name = "name";
          final DateTime dateOfBeginning = DateTime.now();
          final Priority priority = Priority.p1(); //TODO: CREATE MOCK
          // WHEN
          final obj = Task(
            name: name,
            dateOfBeginning: dateOfBeginning,
            priority: priority,
          );
          // THEN
          expect(obj, isA<Task>());
          expect(obj.id, null);
          expect(obj.name, name);
          expect(obj.description, null);
          expect(obj.dateOfBeginning, dateOfBeginning);
          expect(obj.priority, isA<Priority>());
          expect(obj.priority, priority);
        },
      );
    });
    group("Methods -", () {
      group("toMap -", () {
        test("Should return map holding same information as the instance", () {
          // GIVEN
          final int id = 0;
          final String name = "name";
          final String description = "description";
          final DateTime dateOfBeginning = DateTime.now();
          final Priority priority = Priority.p1(); //TODO: CREATE MOCK
          final Task task = Task(
            id: id,
            name: name,
            description: description,
            dateOfBeginning: dateOfBeginning,
            priority: priority,
          );
          // WHEN
          final obj = task.toMap();
          // THEN
          expect(obj, isA<Map<String, dynamic>>());
          expect(obj["id"], id);
          expect(obj["name"], name);
          expect(obj["description"], description);
          expect(obj["dateOfBeginning"], dateOfBeginning.toDb());
          expect(obj["priority"], priority.toString());
        });
      });
      group("toString -", () {
        test("Should return a string describing the instance.", () {
          // GIVEN
          final int id = 0;
          final String name = "name";
          final String description = "description";
          final DateTime dateOfBeginning = DateTime.now();
          final Priority priority = Priority.p1(); //TODO: CREATE MOCK
          final Task task = Task(
            id: id,
            name: name,
            description: description,
            dateOfBeginning: dateOfBeginning,
            priority: priority,
          );
          // WHEN
          final obj = task.toString();
          // THEN
          expect(obj, isA<String>());
          expect(
            obj,
            'Task{id: $id, name: $name, description: $description,dateOfBeginning: ${dateOfBeginning.toDb()} ,priority: ${priority.toString()}}',
          );
        });
      });
    });
  });
}
