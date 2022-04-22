import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/utils/dateTimeExtension.dart';

void main() {
  var today = DateTime.now();
  var testValue;

  group("CorrectTime", (() {
    //today.weekday
    test("If given same day as today, value should return today's date", () {
      testValue = today.next(today.weekday).weekday;
      expect(testValue,today.weekday);
    });
    test(
        "If day is in same week but before today's date, return date from next week",
        () {
          testValue = today.next(today.weekday - 1).weekday;
          expect(testValue,today.weekday - 1);
        });
    test(
        "If given day in same week but after today's date, return date from this week",
        () {
          testValue = today.next(today.weekday + 1).weekday;
          expect(testValue,today.weekday + 1);
        });
  }));
}
