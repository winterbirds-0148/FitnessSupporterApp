import 'package:flutter/material.dart';

class FitnessModel {
  String name, part;
  String category;
  String discpription;

  FitnessModel(
      {required this.name,
      required this.part,
      required this.discpription,
      required this.category});

  Icon getIcon() {
    if (category == 'weight') {
      return const Icon(Icons.fitness_center_outlined);
    } else if (category == 'cardio') {
      return const Icon(Icons.directions_run_rounded);
    } else {
      return const Icon(Icons.text_snippet);
    }
  }
}

class Set {
  int weight, repetition;
  Set({required this.weight, required this.repetition});
}

class FitnessHistory {
  FitnessModel fitness;
  List<Set> history = [];

  FitnessHistory({required this.fitness});

  void addHistory(Set set) {
    history.add(set);
  }
}

class DateHistory {
  String dateId;
  List<FitnessHistory> dateHistory = [];

  DateHistory({required this.dateId});
}
