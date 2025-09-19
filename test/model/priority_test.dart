import 'package:flutter_test/flutter_test.dart';
import 'package:lista_zadan/model/priority.dart';

void main() {
  group("Priority -", () {
    group("Constructor -", () {
      test("Should create an instance with provided PriorityEnum value.", () {
        // GIVEN
        final PriorityEnum priorityEnum = PriorityEnum.p1;
        // WHEN
        final obj = Priority(priority: priorityEnum);
        // THEN
        expect(obj, isA<Priority>());
        expect(obj.priority, priorityEnum);
      });
    });
    group("Factories -", () {
      group("Priority.p1 -", () {
        test("Should create an instance with p1 priority.", () {
          // GIVEN & WHEN
          final obj = Priority.p1();
          // THEN
          expect(obj, isA<Priority>());
          expect(obj.priority, PriorityEnum.p1);
        });
      });
      group("Priority.p2 -", () {
        test("Should create an instance with p2 priority.", () {
          // GIVEN & WHEN
          final obj = Priority.p2();
          // THEN
          expect(obj, isA<Priority>());
          expect(obj.priority, PriorityEnum.p2);
        });
      });
      group("Priority.p3 -", () {
        test("Should create an instance with p3 priority.", () {
          // GIVEN & WHEN
          final obj = Priority.p3();
          // THEN
          expect(obj, isA<Priority>());
          expect(obj.priority, PriorityEnum.p3);
        });
      });
      group("Priority.fromString -", () {
        test(
          "Should create an instance with p1 priority when \"1\" is provided",
          () {
            // GIVEN
            final String priorityStr = "1";
            // WHEN
            final obj = Priority.fromString(priorityStr: priorityStr);
            // THEN
            expect(obj, isA<Priority>());
            expect(obj.priority, PriorityEnum.p1);
          },
        );
        test(
          "Should create an instance with p2 priority when \"2\" is provided",
          () {
            // GIVEN
            final String priorityStr = "2";
            // WHEN
            final obj = Priority.fromString(priorityStr: priorityStr);
            // THEN
            expect(obj, isA<Priority>());
            expect(obj.priority, PriorityEnum.p2);
          },
        );
        test(
          "Should create an instance with p3 priority when \"3\" is provided",
          () {
            // GIVEN
            final String priorityStr = "3";
            // WHEN
            final obj = Priority.fromString(priorityStr: priorityStr);
            // THEN
            expect(obj, isA<Priority>());
            expect(obj.priority, PriorityEnum.p3);
          },
        );
        test(
          "Should cretae an isntance with p1 priority when provided string isn't \"1\" or \"2\" or \"3\"",
          () {
            // GIVEN
            final String priorityStr = "213";
            // WHEN
            final obj = Priority.fromString(priorityStr: priorityStr);
            // THEN
            expect(obj, isA<Priority>());
            expect(obj.priority, PriorityEnum.p1);
          },
        );
      });
    });
    group("Methods -", () {
      group("toString -", () {
        test(
          "Should return \"1\" string when the instance has p1 priority",
          () {
            // GIVEN
            final Priority priority = Priority.p1();
            // WHEN
            final obj = priority.toString();
            // THEN
            expect(obj, isA<String>());
            expect(obj, "1");
          },
        );
        test(
          "Should return \"2\" string when the instance has p2 priority",
          () {
            // GIVEN
            final Priority priority = Priority.p2();
            // WHEN
            final obj = priority.toString();
            // THEN
            expect(obj, isA<String>());
            expect(obj, "2");
          },
        );
        test(
          "Should return \"3\" string when the instance has p3 priority",
          () {
            // GIVEN
            final Priority priority = Priority.p3();
            // WHEN
            final obj = priority.toString();
            // THEN
            expect(obj, isA<String>());
            expect(obj, "3");
          },
        );
      });
      group("allOptions -", () {
        test("Should return a list of every Priority variants", () {
          // GIVEN & WHEN
          final obj = Priority.allOptions();
          // THEN
          expect(obj, isA<List<Priority>>());
          expect(obj, [Priority.p1(), Priority.p2(), Priority.p3()]);
        });
      });
    });
    group("Operators -", () {
      group("\">\" -", () {
        test(
          "Should return true when instance with p3 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p3 > p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p3 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p3 > p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p2 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p2 > p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return false when instance with p1 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p1 > p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p1 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p1 > p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p2 > p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p1 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p12 = Priority.p1();
            // WHEN
            final obj = p1 > p12;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p22 = Priority.p2();
            // WHEN
            final obj = p2 > p22;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p32 = Priority.p3();
            // WHEN
            final obj = p3 > p32;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
      });
      group("\"<\" -", () {
        test(
          "Should return true when instance with p1 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p1 < p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p1 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p1 < p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p2 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p2 < p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p3 < p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p3 < p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p2 < p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p1 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p12 = Priority.p1();
            // WHEN
            final obj = p1 < p12;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p22 = Priority.p2();
            // WHEN
            final obj = p2 < p22;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p32 = Priority.p3();
            // WHEN
            final obj = p3 < p32;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
      });
      group("\">=\" -", () {
        test(
          "Should return true when instance with p3 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p3 >= p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p3 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p3 >= p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p2 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p2 >= p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return false when instance with p1 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p1 >= p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p1 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p1 >= p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p2 >= p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return true when instance with p1 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p12 = Priority.p1();
            // WHEN
            final obj = p1 >= p12;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p2 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p22 = Priority.p2();
            // WHEN
            final obj = p2 >= p22;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p3 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p32 = Priority.p3();
            // WHEN
            final obj = p3 >= p32;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
      });
      group("\"<=\" -", () {
        test(
          "Should return true when instance with p1 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p1 <= p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p1 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p1 <= p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p2 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p2 <= p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p3 <= p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p3 <= p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p2 <= p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return true when instance with p1 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p12 = Priority.p1();
            // WHEN
            final obj = p1 <= p12;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p2 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p22 = Priority.p2();
            // WHEN
            final obj = p2 <= p22;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p3 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p32 = Priority.p3();
            // WHEN
            final obj = p3 <= p32;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
      });
      group("\"==\" -", () {
        test(
          "Should return false when instance with p1 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p1 == p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p1 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p1 == p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p3 = Priority.p3();
            // WHEN
            final obj = p2 == p3;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p2 = Priority.p2();
            // WHEN
            final obj = p3 == p2;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p3 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p3 == p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return false when instance with p2 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p1 = Priority.p1();
            // WHEN
            final obj = p2 == p1;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, false);
          },
        );
        test(
          "Should return true when instance with p1 priority is compared to instance with p1 priority",
          () {
            // GIVEN
            final Priority p1 = Priority.p1();
            final Priority p12 = Priority.p1();
            // WHEN
            final obj = p1 == p12;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p2 priority is compared to instance with p2 priority",
          () {
            // GIVEN
            final Priority p2 = Priority.p2();
            final Priority p22 = Priority.p2();
            // WHEN
            final obj = p2 == p22;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
        test(
          "Should return true when instance with p3 priority is compared to instance with p3 priority",
          () {
            // GIVEN
            final Priority p3 = Priority.p3();
            final Priority p32 = Priority.p3();
            // WHEN
            final obj = p3 == p32;
            // THEN
            expect(obj, isA<bool>());
            expect(obj, true);
          },
        );
      });
    });
  });
}
