class StepModel {
  final int? id;
  final DateTime date;
  final int stepCount;
  final double distance;
  final double calories;

  StepModel({
    this.id,
    required this.date,
    required this.stepCount,
    required this.distance,
    required this.calories,
  });


  // Convert Model to Map (For Database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'step_count': stepCount,
      'distance': distance,
      'calories': calories,
    };
  }

  factory StepModel.fromMap(Map<String, dynamic> map) {
    return StepModel(
      id: map['id'],
      date: DateTime.parse(map['date']),
      stepCount: map['step_count'],
      distance: map['distance'],
      calories: map['calories'],
    );
  }
}
