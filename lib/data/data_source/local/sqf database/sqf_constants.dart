class StepsConstants {
  StepsConstants._();

  // Table Name
  static const String tableName = "steps";

  // Columns
  static const String id = "id";
  static const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";

  static const String date = "date";
  static const String dateType = "TEXT UNIQUE";

  static const String stepCount = "step_count";
  static const String stepCountType = "INTEGER";

  static const String distance = "distance";
  static const String distanceType = "REAL";

  static const String calories = "calories";
  static const String caloriesType = "REAL";
}

class WorkoutConstants {
  WorkoutConstants._();

  // Table Name
  static const String tableName = "workouts";

  // Columns
  static const String id = "id";
  static const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";

  static const String date = "date";
  static const String dateType = "TEXT";

  static const String exerciseName = "exercise_name";
  static const String exerciseNameType = "TEXT";

  static const String setNumber = "setNumber";
  static const String setsType = "INTEGER";

  static const String reps = "reps";
  static const String repsType = "INTEGER";

  static const String weight = "weight";
  static const String weightType = "REAL";

  static const String volume = "volume";
  static const String volumeType = "REAL";

  static const String caloriesBurned = "calories_burned";
  static const String caloriesBurnedType = "REAL";
}