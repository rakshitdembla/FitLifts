import '../../../models/exercise.dart';

List<Exercise> chestExercises = [
  // Home Workouts  
  Exercise(
    name: "Push-Ups",
    targetMuscle: "Whole Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Start in a high plank position with your hands slightly wider than shoulder-width.  
    2. Lower your chest towards the ground while keeping your body straight.  
    3. Push back up until your arms are fully extended.  
    """,
    commonMistakes: """
    1. Sagging hips—keep your core engaged.  
    2. Flaring elbows—keep them at a 45-degree angle.  
    """,
    setsAndReps: "3 sets of 15-20 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Incline Push-Ups",
    targetMuscle: "Upper Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Place your hands on an elevated surface like a bench or table.  
    2. Lower your chest towards the surface while keeping your body straight.  
    3. Push back up to the starting position.  
    """,
    commonMistakes: """
    1. Dropping hips—maintain a straight line.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Decline Push-Ups",
    targetMuscle: "Lower Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Place your feet on an elevated surface and hands on the ground.  
    2. Lower your chest towards the ground while keeping your core tight.  
    3. Push back up until your arms are extended.  
    """,
    commonMistakes: """
    1. Losing control—lower yourself slowly.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  // Gym Workouts  
  Exercise(
    name: "Flat Bench Press",
    targetMuscle: "Whole Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "Barbell, Bench",
    instructions: """
    1. Lie on a flat bench and grip the barbell slightly wider than shoulder-width.  
    2. Lower the bar slowly to your chest.  
    3. Press the bar back up until your arms are extended.  
    """,
    commonMistakes: """
    1. Bouncing the bar off the chest—control the movement.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Incline Bench Press",
    targetMuscle: "Upper Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "Barbell, Incline Bench",
    instructions: """
    1. Lie on an incline bench and grip the bar slightly wider than shoulder-width.  
    2. Lower the bar slowly to your upper chest.  
    3. Press the bar back up until your arms are extended.  
    """,
    commonMistakes: """
    1. Arching your lower back too much—keep your core tight.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Decline Bench Press",
    targetMuscle: "Lower Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "Barbell, Decline Bench",
    instructions: """
    1. Lie on a decline bench and grip the bar slightly wider than shoulder-width.  
    2. Lower the bar slowly to your lower chest.  
    3. Press the bar back up until your arms are extended.  
    """,
    commonMistakes: """
    1. Letting the bar bounce—always control the weight.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Chest Dips",
    targetMuscle: "Lower Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "Parallel Bars",
    instructions: """
    1. Grab the parallel bars and lift yourself up.  
    2. Lean slightly forward and lower your body until your elbows are at 90 degrees.  
    3. Push yourself back up to the starting position.  
    """,
    commonMistakes: """
    1. Staying too upright—lean forward to target chest.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Machine Chest Press",
    targetMuscle: "Whole Chest",
    secondaryMuscles: ["Triceps", "Shoulders"],
    equipment: "Chest Press Machine",
    instructions: """
    1. Sit on the machine with your back flat against the pad.  
    2. Press the handles forward until your arms are extended.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Locking elbows at the top—keep a slight bend.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Cable Flys",
    targetMuscle: "Whole Chest",
    secondaryMuscles: ["Shoulders"],
    equipment: "Cable Machine",
    instructions: """
    1. Stand in the center of a cable machine with handles in both hands.  
    2. Pull the cables forward in a wide arc until hands meet in front of you.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Using too much weight—focus on control.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Pec Deck Machine",
    targetMuscle: "Whole Chest",
    secondaryMuscles: ["Shoulders"],
    equipment: "Pec Deck Machine",
    instructions: """
    1. Sit on the machine with your back against the pad.  
    2. Bring the handles together in front of your chest.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Rushing the movement—use slow, controlled reps.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),
  
];
