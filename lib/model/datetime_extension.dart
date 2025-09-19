extension DatetimeExtension on DateTime {
  String toDb() {
    return "$year-$month-$day";
  }

  String toUi() {
    String dd = "$day";
    if (dd.length == 1) {
      dd = "0$dd";
    }
    String mm = "$month";
    if (mm.length == 1) {
      mm = "0$mm";
    }
    return "$dd.$mm.$year";
  }
}
