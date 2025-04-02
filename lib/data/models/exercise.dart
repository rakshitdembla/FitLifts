class Exercise {
  final String name;
  final String targetMuscle;
  final List<String>? secondaryMuscles;
  final String equipment;
  final String instructions;
  final String commonMistakes;
  final String? setsAndReps;
  final bool? homeWorkout;

  Exercise({
    required this.name,
    required this.targetMuscle,
    required this.secondaryMuscles,
    required this.equipment,
    required this.instructions,
    required this.commonMistakes,
    required this.setsAndReps,
    required this.homeWorkout
  });
}
