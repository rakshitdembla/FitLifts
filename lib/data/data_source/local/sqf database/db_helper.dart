import "package:fitlifts/core/constants/my_strings.dart";
import "package:fitlifts/data/data_source/local/sqf%20database/sqf_constants.dart";
import "package:fitlifts/data/models/workout_model.dart";
import "package:fitlifts/data/models/step_model.dart";
import "package:intl/intl.dart";
import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";

class DBHelper {
  DBHelper();
  Database? database;
  // check if db already exists or create new
  Future<Database?> fetchDB() async {
    if (database != null) {
      return database;
    } else {
      database = await createDB();
      return database;
    }
  }

  //? create new db
  Future<Database?> createDB() async {
    final String dbPath = join(await getDatabasesPath(), "fitlifts.db");
    return await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE ${StepsConstants.tableName} (
          ${StepsConstants.id} ${StepsConstants.idType},
          ${StepsConstants.date} ${StepsConstants.dateType},
          ${StepsConstants.stepCount} ${StepsConstants.stepCountType},
          ${StepsConstants.distance} ${StepsConstants.distanceType},
          ${StepsConstants.calories} ${StepsConstants.caloriesType}
        )
      ''');

        await db.execute('''
        CREATE TABLE ${WorkoutConstants.tableName} (
          ${WorkoutConstants.id} ${WorkoutConstants.idType},
          ${WorkoutConstants.date} ${WorkoutConstants.dateType},
          ${WorkoutConstants.exerciseName} ${WorkoutConstants.exerciseNameType},
          ${WorkoutConstants.setNumber} ${WorkoutConstants.setsType},
          ${WorkoutConstants.reps} ${WorkoutConstants.repsType},
          ${WorkoutConstants.weight} ${WorkoutConstants.weightType},
          ${WorkoutConstants.volume} ${WorkoutConstants.volumeType},
          ${WorkoutConstants.caloriesBurned} ${WorkoutConstants.caloriesBurnedType}
        )
      ''');
      },
      version: 1,
    );
  }

  // ***@STEPS DB HELPERS***

  // INSERT STEPS DATA
  Future<int> insertSteps(StepModel steps) async {
    final dbClient = await fetchDB();
    return await dbClient!.insert(
      StepsConstants.tableName,
      steps.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //GET LAST 7 DAYS STEPS DATA
  Future<List<StepModel>> getWeekSteps() async {
    final dbClient = await fetchDB();
    final result = await dbClient!.rawQuery(
      """SELECT * FROM ${StepsConstants.tableName} WHERE ${StepsConstants.date} >= date('now','-6 days') ORDER BY ${StepsConstants.date} DESC""",
    );

    return result.map((x) => StepModel.fromMap(x)).toList();
  }

  //GET ALL STEPS DATA ASC OR DESC
  Future<List<StepModel>> getAllSteps(bool isASC) async {
    final dbClient = await fetchDB();
    String orderBy =
        isASC ? "${StepsConstants.date} ASC" : "${StepsConstants.date} DESC";

    final result = await dbClient!.query(
      StepsConstants.tableName,
      orderBy: orderBy,
    );
    return result.map((x) => StepModel.fromMap(x)).toList();
  }

  //GET SUM OF TODAY'S STEPS DETAILS

  Future<Map<String, double>> getTotalStepsForToday() async {
    final dbClient = await fetchDB();
    var result = await dbClient!.rawQuery(
      '''
    SELECT SUM(${StepsConstants.stepCount}) AS ${MyStrings.steps},
           SUM(${StepsConstants.distance}) AS ${MyStrings.distance},
           SUM(${StepsConstants.calories}) AS ${MyStrings.calories}
    FROM ${StepsConstants.tableName}
    WHERE DATE(${StepsConstants.date}) = ?
    ''',
      [DateFormat('yyyy-MM-dd').format(DateTime.now())],
    );
    return {
      MyStrings.steps:
          (result.first[MyStrings.steps] as num?)?.toDouble() ?? 0.0,
      MyStrings.distance:
          (result.first[MyStrings.distance] as num?)?.toDouble() ?? 0.0,
      MyStrings.calories:
          (result.first[MyStrings.calories] as num?)?.toDouble() ?? 0.0,
    };
  }

  // ***@ WORKOUT DB HELPERS***

  //INSERT WORKOUTS DATA
  Future<int> insertWorkout(WorkoutModel workout) async {
    final dbClient = await fetchDB();
    return await dbClient!.insert(
      WorkoutConstants.tableName,
      workout.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //GET TODAY'S WORKOUT DATA
  Future<double> getTotalWorkoutVolumeForToday() async {
    final dbClient = await fetchDB();
    var result = await dbClient!.rawQuery(
      '''
    SELECT SUM(${WorkoutConstants.volume}) AS ${MyStrings.workoutVolume}
    FROM ${WorkoutConstants.tableName}
    WHERE DATE(${WorkoutConstants.date}) = ?
    ''',
      [DateFormat('yyyy-MM-dd').format(DateTime.now())],
    );

    return (result.first[MyStrings.workoutVolume] as num?)?.toDouble() ?? 0.0;
  }

  //GET ALL WORKOUTS ASC OR DESC
  Future<List<WorkoutModel>> getAllWorkout(bool isASC) async {
    final dbClient = await fetchDB();
    String orderBy =
        isASC
            ? "${WorkoutConstants.date} ASC"
            : "${WorkoutConstants.date} DESC";
    final result = await dbClient!.query(
      WorkoutConstants.tableName,
      orderBy: orderBy,
    );
    return result.map((x) => WorkoutModel.fromMap(x)).toList();
  }

  //! CLOSE DB
  Future<void> closeDB() async {
    final dbClient = await fetchDB();
    await dbClient?.close();
  }

  //CLEAR ALL DATA
  Future<void> deleteAllData() async {
    final dbClient = await fetchDB();
    await dbClient!.delete(StepsConstants.tableName);
    await dbClient.delete(WorkoutConstants.tableName);
  }
}
