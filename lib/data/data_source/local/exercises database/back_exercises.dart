import '../../../models/exercise.dart';

List<Exercise> backExercises = [
  // Home Workouts (6 Exercises)
  Exercise(
    name: "Superman Hold",
    targetMuscle: "Lower Back",
    secondaryMuscles: ["Glutes", "Core"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie face down on the floor with arms extended forward and legs straight.  
    2. Lift your arms, chest, and legs off the ground simultaneously.  
    3. Hold the position for the desired time, then lower back down.  
    """,
    commonMistakes: """
    1. Arching the neck too much—keep it neutral.  
    2. Holding your breath—remember to breathe steadily.  
    """,
    setsAndReps: "3 sets of 20-30 seconds hold",
    homeWorkout: true,
  ),

  Exercise(
    name: "Inverted Rows (Under Table)",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Biceps", "Rear Shoulders"],
    equipment: "Table or Sturdy Bar (Home-Friendly)",
    instructions: """
    1. Lie under a sturdy table or bar and grab the edge with an overhand grip.  
    2. Pull your chest up towards the table/bar while keeping your body straight.  
    3. Lower yourself back down with control.  
    """,
    commonMistakes: """
    1. Letting your hips sag—keep your body in a straight line.  
    """,
    setsAndReps: "3 sets of 8-12 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Resistance Band Pull-Aparts",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Rear Shoulders", "Traps"],
    equipment: "Resistance Band (Home-Friendly)",
    instructions: """
    1. Hold a resistance band with both hands in front of you at shoulder height.  
    2. Pull the band apart by moving your arms out to the sides.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Using too much momentum—focus on controlled movements.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Bird Dog",
    targetMuscle: "Lower Back",
    secondaryMuscles: ["Core", "Glutes"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Start on all fours with your hands under your shoulders and knees under your hips.  
    2. Extend one arm and the opposite leg simultaneously.  
    3. Hold for a moment, then return to the starting position and switch sides.  
    """,
    commonMistakes: """
    1. Letting your hips sway—keep your core engaged and body stable.  
    """,
    setsAndReps: "3 sets of 10-12 reps per side",
    homeWorkout: true,
  ),

  Exercise(
    name: "Prone Cobra",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Rear Shoulders", "Lower Back"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie face down on the floor with your arms at your sides.  
    2. Lift your chest, arms, and legs off the ground while squeezing your shoulder blades together.  
    3. Hold the position for a few seconds, then lower back down.  
    """,
    commonMistakes: """
    1. Overarching the neck—keep it neutral and aligned with your spine.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Doorway Rows (Resistance Band)",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Biceps", "Rear Shoulders"],
    equipment: "Resistance Band (Home-Friendly)",
    instructions: """
    1. Anchor a resistance band around a sturdy door handle.  
    2. Sit back with your legs straight and pull the band towards your torso.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Using too much arm strength—focus on engaging your back muscles.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: true,
  ),

  // Gym Workouts (14 Exercises)
  Exercise(
    name: "Pull-Ups",
    targetMuscle: "Lats",
    secondaryMuscles: ["Biceps", "Upper Back"],
    equipment: "Pull-Up Bar",
    instructions: """
    1. Grab the pull-up bar with an overhand grip, hands slightly wider than shoulder-width.  
    2. Pull your body up until your chin is above the bar.  
    3. Lower yourself back down with control.  
    """,
    commonMistakes: """
    1. Swinging your body—use controlled movements.  
    """,
    setsAndReps: "3 sets of 6-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Barbell Deadlift",
    targetMuscle: "Lower Back",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Barbell",
    instructions: """
    1. Stand with your feet hip-width apart and a barbell on the floor in front of you.  
    2. Bend at the hips and knees to grip the barbell with an overhand grip.  
    3. Lift the barbell by extending your hips and knees, keeping your back straight.  
    4. Lower the barbell back to the floor with control.  
    """,
    commonMistakes: """
    1. Rounding your back—keep it neutral throughout the movement.  
    """,
    setsAndReps: "4 sets of 6-8 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Lat Pulldown",
    targetMuscle: "Lats",
    secondaryMuscles: ["Biceps", "Upper Back"],
    equipment: "Cable Machine",
    instructions: """
    1. Sit at a lat pulldown machine and grab the bar with a wide overhand grip.  
    2. Pull the bar down to your chest while keeping your torso upright.  
    3. Slowly return the bar to the starting position.  
    """,
    commonMistakes: """
    1. Leaning back too far—keep your torso stable.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Bent-Over Barbell Row",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Lats", "Biceps"],
    equipment: "Barbell",
    instructions: """
    1. Stand with your feet shoulder-width apart and a barbell in front of you.  
    2. Bend at the hips and knees to grip the barbell with an overhand grip.  
    3. Pull the barbell towards your torso, keeping your back straight.  
    4. Lower the barbell back down with control.  
    """,
    commonMistakes: """
    1. Rounding your back—maintain a neutral spine.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Seated Cable Row",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Lats", "Biceps"],
    equipment: "Cable Machine",
    instructions: """
    1. Sit at a cable row machine and grab the handle with both hands.  
    2. Pull the handle towards your torso while keeping your back straight.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Using momentum—focus on controlled movements.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "T-Bar Row",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Lats", "Biceps"],
    equipment: "T-Bar Machine or Barbell",
    instructions: """
    1. Stand on the T-bar machine or place a barbell in a corner.  
    2. Bend at the hips and grip the handle or barbell with both hands.  
    3. Pull the weight towards your torso, squeezing your shoulder blades together.  
    4. Lower the weight back down with control.  
    """,
    commonMistakes: """
    1. Rounding your back—keep it neutral throughout the movement.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Single-Arm Dumbbell Row",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Lats", "Biceps"],
    equipment: "Dumbbell",
    instructions: """
    1. Place one knee and hand on a bench for support, with the other foot on the floor.  
    2. Hold a dumbbell in your free hand and pull it towards your torso.  
    3. Lower the dumbbell back down with control.  
    """,
    commonMistakes: """
    1. Twisting your torso—keep your body stable.  
    """,
    setsAndReps: "3 sets of 10-12 reps per side",
    homeWorkout: false,
  ),

  Exercise(
    name: "Cable Face Pull",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Rear Shoulders", "Traps"],
    equipment: "Cable Machine",
    instructions: """
    1. Set the cable pulley to face height and attach a rope handle.  
    2. Pull the rope towards your face, keeping your elbows high.  
    3. Squeeze your shoulder blades together at the top.  
    4. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Letting your elbows drop—keep them elevated.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Machine Row",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Lats", "Biceps"],
    equipment: "Row Machine",
    instructions: """
    1. Sit on the row machine and grab the handles.  
    2. Pull the handles towards your torso while keeping your back straight.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Using too much weight—focus on proper form.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Chin-Ups",
    targetMuscle: "Lats",
    secondaryMuscles: ["Biceps", "Upper Back"],
    equipment: "Pull-Up Bar",
    instructions: """
    1. Grab the pull-up bar with an underhand grip, hands shoulder-width apart.  
    2. Pull your body up until your chin is above the bar.  
    3. Lower yourself back down with control.  
    """,
    commonMistakes: """
    1. Swinging your body—use controlled movements.  
    """,
    setsAndReps: "3 sets of 6-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Hyperextensions",
    targetMuscle: "Lower Back",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Hyperextension Bench",
    instructions: """
    1. Position yourself on the hyperextension bench with your feet secured.  
    2. Lower your upper body towards the floor, then lift it back up.  
    3. Squeeze your lower back at the top of the movement.  
    """,
    commonMistakes: """
    1. Overarching your back—keep the movement controlled.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Reverse Fly (Dumbbell)",
    targetMuscle: "Upper Back",
    secondaryMuscles: ["Rear Shoulders", "Traps"],
    equipment: "Dumbbells",
    instructions: """
    1. Bend slightly forward at the waist while holding dumbbells.  
    2. Lift your arms out to the sides, squeezing your shoulder blades together.  
    3. Lower the dumbbells back down with control.  
    """,
    commonMistakes: """
    1. Using too much weight—focus on proper form.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Wide-Grip Pull-Up",
    targetMuscle: "Lats",
    secondaryMuscles: ["Upper Back", "Biceps"],
    equipment: "Pull-Up Bar",
    instructions: """
    1. Grab the pull-up bar with a wide overhand grip.  
    2. Pull your body up until your chin is above the bar.  
    3. Lower yourself back down with control.  
    """,
    commonMistakes: """
    1. Swinging your body—use controlled movements.  
    """,
    setsAndReps: "3 sets of 6-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Deadlift (Dumbbell)",
    targetMuscle: "Lower Back",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Dumbbells",
    instructions: """
    1. Stand with your feet hip-width apart and hold dumbbells in front of your thighs.  
    2. Bend at the hips and knees to lower the dumbbells towards the floor.  
    3. Lift the dumbbells back up by extending your hips and knees.  
    """,
    commonMistakes: """
    1. Rounding your back—keep it neutral throughout the movement.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),
];