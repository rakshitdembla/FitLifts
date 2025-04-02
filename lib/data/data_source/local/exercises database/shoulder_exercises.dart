import '../../../models/exercise.dart';

List<Exercise> shoulderExercises = [
  // Home Workouts  
  Exercise(
    name: "Pike Push-Ups",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Triceps", "Upper Chest"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Get into a push-up position and raise your hips to form an inverted V shape.  
    2. Lower your head towards the ground by bending your elbows.  
    3. Push back up to the starting position.  
    """,
    commonMistakes: """
    1. Not keeping your hips high—maintain the inverted V shape throughout the movement.  
    """,
    setsAndReps: "3 sets of 10-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Handstand Hold",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Triceps", "Core"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Kick up into a handstand against a wall for balance.  
    2. Hold the position while keeping your core engaged.  
    3. Lower yourself carefully after completing the set.  
    """,
    commonMistakes: """
    1. Arching your back—keep your body straight and avoid overextending.  
    """,
    setsAndReps: "3 sets of 30-45 seconds hold",
    homeWorkout: true,
  ),

  Exercise(
    name: "Lateral Raises (Bottle/Resistance Band)",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Traps"],
    equipment: "Resistance Band (Home-Friendly)",
    instructions: """
    1. Stand upright with a resistance band in each hand.  
    2. Lift your arms out to the sides until they reach shoulder height.  
    3. Lower them back down slowly with control.  
    """,
    commonMistakes: """
    1. Using momentum—focus on controlled movements and avoid swinging.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Front Raises (Bottle/Resistance Band)",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Traps"],
    equipment: "Resistance Band (Home-Friendly)",
    instructions: """
    1. Hold a resistance band in each hand.  
    2. Lift your arms straight in front of you to shoulder height.  
    3. Lower them back down with control.  
    """,
    commonMistakes: """
    1. Raising arms too high—stop at shoulder level to avoid unnecessary strain.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  // Gym Workouts  
  Exercise(
    name: "Seated Dumbbell Shoulder Press",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Triceps", "Upper Chest"],
    equipment: "Dumbbells, Bench",
    instructions: """
    1. Sit on a bench with a dumbbell in each hand at shoulder height.  
    2. Press the dumbbells overhead until your arms are fully extended.  
    3. Lower them back down slowly.  
    """,
    commonMistakes: """
    1. Arching your back—keep your core engaged and maintain proper posture.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Arnold Press",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Triceps", "Upper Chest"],
    equipment: "Dumbbells, Bench",
    instructions: """
    1. Hold dumbbells at shoulder height with palms facing you.  
    2. Rotate your hands outward as you press the dumbbells overhead.  
    3. Lower them back to the starting position with control.  
    """,
    commonMistakes: """
    1. Rushing the movement—focus on slow and controlled repetitions.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Dumbbell Lateral Raises",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Traps"],
    equipment: "Dumbbells",
    instructions: """
    1. Hold a dumbbell in each hand and stand upright.  
    2. Lift your arms out to the sides until they reach shoulder height.  
    3. Lower them back down with control.  
    """,
    commonMistakes: """
    1. Using heavy weights—opt for lighter weights to maintain proper form.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Cable Lateral Raises",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Traps"],
    equipment: "Cable Machine",
    instructions: """
    1. Set the cable pulley to the lowest position.  
    2. Grab the handle and lift your arm to the side until it reaches shoulder height.  
    3. Lower it back down slowly.  
    """,
    commonMistakes: """
    1. Using too much weight—focus on strict form and avoid swinging.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Bent-Over Dumbbell Reverse Fly",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Upper Back"],
    equipment: "Dumbbells",
    instructions: """
    1. Bend slightly forward at the waist while holding dumbbells.  
    2. Lift your arms out to the sides, squeezing your shoulder blades together.  
    3. Lower them back down slowly.  
    """,
    commonMistakes: """
    1. Swinging weights—use controlled movements and avoid momentum.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Face Pulls",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Traps", "Upper Back"],
    equipment: "Cable Machine",
    instructions: """
    1. Set the cable pulley to face level and attach a rope handle.  
    2. Pull the rope towards your face, keeping your elbows high.  
    3. Squeeze your shoulder blades at the top and return to the starting position.  
    """,
    commonMistakes: """
    1. Letting elbows drop—keep them elevated throughout the movement.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Military Press (Barbell)",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Triceps", "Upper Chest"],
    equipment: "Barbell",
    instructions: """
    1. Hold a barbell at shoulder height with palms facing forward.  
    2. Press the bar overhead until your arms are fully extended.  
    3. Lower it back down slowly.  
    """,
    commonMistakes: """
    1. Locking elbows at the top—maintain a slight bend to avoid joint strain.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Dumbbell Front Raises",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Traps"],
    equipment: "Dumbbells",
    instructions: """
    1. Hold a dumbbell in each hand with palms facing your thighs.  
    2. Lift one or both arms straight in front of you to shoulder height.  
    3. Lower them back down slowly with control.  
    """,
    commonMistakes: """
    1. Swinging the dumbbells—focus on slow and controlled movements.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Machine Shoulder Press",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Triceps", "Upper Chest"],
    equipment: "Shoulder Press Machine",
    instructions: """
    1. Sit on the machine and adjust the seat so the handles are at shoulder height.  
    2. Press the handles upward until your arms are fully extended.  
    3. Lower them back down slowly with control.  
    """,
    commonMistakes: """
    1. Not adjusting the seat properly—ensure the correct range of motion.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Upright Rows",
    targetMuscle: "Shoulder",
    secondaryMuscles: ["Traps", "Upper Chest"],
    equipment: "Barbell or EZ Bar",
    instructions: """
    1. Hold a barbell or EZ bar with a shoulder-width grip.  
    2. Pull the bar up towards your chin, keeping your elbows higher than your wrists.  
    3. Lower it back down slowly.  
    """,
    commonMistakes: """
    1. Lifting too high—stop at upper chest level to avoid shoulder strain.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),
];