import 'package:flutter_test/flutter_test.dart';
import 'package:lista_zadan/model/datetime_extension.dart';
void main() {
  group("DateTimeExtension -",(){
    group("toDb() -",(){
      test("Should return database formated date string.",(){
        // GIVEN
        final year = 1999;
        final month = 5;
        final day = 7;
        final DateTime dateTime = DateTime(year, month, day);
        // WHEN
        final obj = dateTime.toDb();
        // THEN
        expect(obj, isA<String>());
        expect(obj, "$year-$month-$day");
      });
    });
    group("toUi() -", (){
      test("Should return Ui formated date string.",(){
        // GIVEN
        final year = 1999;
        final month = 11;
        final day = 11;
        final DateTime dateTime = DateTime(year, month, day);
        // WHEN
        final obj = dateTime.toUi();
        // THEN
        expect(obj, isA<String>());
        expect(obj, "$day.$month.$year");
      });
      test("Should return Ui formated date string with added 0 as prefix for one digit day/month.",(){
        // GIVEN
        final year = 1999;
        final month = 5;
        final day = 7;
        final DateTime dateTime = DateTime(year, month, day);
        // WHEN
        final obj = dateTime.toUi();
        // THEN
        expect(obj, isA<String>());
        expect(obj, "0$day.0$month.$year");
      });
    });
  });
}