import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String name;
  String description;
  DateTime startTime;
  DateTime endTime;
  String priority;
  bool isCompleted;

  Task({
    required this.name,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.priority,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'priority': priority,
      'isCompleted': isCompleted,
    };
  }

  static Task fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Task(
      name: snapshot['name'],
      description: snapshot['description'],
      startTime: DateTime.parse(snapshot['startTime']),
      endTime: DateTime.parse(snapshot['endTime']),
      priority: snapshot['priority'],
      isCompleted: snapshot['isCompleted'] ?? false,
    );
  }
}
