enum PriorityEnum { p1, p2, p3 }

class Priority {
  Priority({required this.priority});
  factory Priority.p1() {
    return Priority(priority: PriorityEnum.p1);
  }
  factory Priority.p2() {
    return Priority(priority: PriorityEnum.p2);
  }
  factory Priority.p3() {
    return Priority(priority: PriorityEnum.p3);
  }
  factory Priority.fromString({required String priorityStr}) {
    return switch (priorityStr) {
      '1' => Priority.p1(),
      '2' => Priority.p2(),
      '3' => Priority.p3(),
      String() => Priority.p1(), //defaults to the lowest priority
    };
  }
  PriorityEnum priority;
  @override
  String toString() {
    String str;
    switch (priority) {
      case PriorityEnum.p1:
        str = "1";
        break;
      case PriorityEnum.p2:
        str = "2";
        break;
      case PriorityEnum.p3:
        str = "3";
        break;
    }
    return str;
  }

  static List<Priority> allOptions() {
    List<Priority> list = [
      Priority(priority: PriorityEnum.p1),
      Priority(priority: PriorityEnum.p2),
      Priority(priority: PriorityEnum.p3),
    ];
    return list;
  }

  bool operator >(Priority other) {
    if (priority == PriorityEnum.p3 &&
        (other.priority == PriorityEnum.p2 ||
            other.priority == PriorityEnum.p1)) {
      return true;
    } else if (priority == PriorityEnum.p2 &&
        other.priority == PriorityEnum.p1) {
      return true;
    } else {
      return false;
    }
  }

  bool operator <(Priority other) {
    if (priority == PriorityEnum.p1 &&
        (other.priority == PriorityEnum.p2 ||
            other.priority == PriorityEnum.p3)) {
      return true;
    } else if (priority == PriorityEnum.p2 &&
        other.priority == PriorityEnum.p3) {
      return true;
    } else {
      return false;
    }
  }

  bool operator >=(Priority other) {
    return !(this < other);
  }

  bool operator <=(Priority other) {
    return !(this > other);
  }

  @override
  bool operator ==(Object other) {
    return other is Priority && other.priority == priority;
  }

  @override
  int get hashCode => priority.hashCode;
}
