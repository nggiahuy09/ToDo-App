import 'package:flutter/material.dart';

class DataItems {
  final String id;
  final String name;
  final DateTime date;
  final TimeOfDay time;

  DataItems({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
  });
}
