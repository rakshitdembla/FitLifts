class HistoryDataModel {
  final String date;
  final String day;
  final int steps;
  final double distance;
  final double stepsCalories;
  final double workoutVolume;
  final double workoutCalories;

  HistoryDataModel({
    required this.distance,
    required this.date,
    required this.day,
    required this.steps,
    required this.stepsCalories,
    required this.workoutVolume,
    required this.workoutCalories,
  });

  HistoryDataModel copyWith({
    int? steps,
    double? distance,
    double? stepsCalories,
    double? workoutVolume,
    double? workoutCalories,
  }) {
    return HistoryDataModel(
      date: date,
      day: day,
      steps: steps ?? this.steps,
      distance: distance ?? this.distance,
      stepsCalories: stepsCalories ?? this.stepsCalories,
      workoutVolume: workoutVolume ?? this.workoutVolume,
      workoutCalories: workoutCalories ?? this.workoutCalories,
    );
  }
}
