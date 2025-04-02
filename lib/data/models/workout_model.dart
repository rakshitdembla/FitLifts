class WorkoutModel {
  final int? id;
  final DateTime date;
  final String exerciseName;
  final int? setNumber;
  final int reps;
  final double weight; // in kg
  final double volume; // weight * reps * setNumber
  final double caloriesBurned;

  WorkoutModel({
    this.id,
    required this.date,
    required this.exerciseName,
     this.setNumber,
    required this.reps,
    required this.weight,
    required this.volume,
    required this.caloriesBurned,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'exercise_name': exerciseName,
      'setNumber': setNumber,
      'reps': reps,
      'weight': weight,
      'volume': volume,
      'calories_burned': caloriesBurned,
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      id: map['id'],
      date:  DateTime.parse(map['date']),
      exerciseName: map['exercise_name'],
      setNumber: map['setNumber'],
      reps: map['reps'],
      weight: map['weight'],
      volume: map['volume'],
      caloriesBurned: map['calories_burned'],
    );
  }
}
