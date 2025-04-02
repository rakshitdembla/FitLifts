import '../../../models/exercise.dart';

List<Exercise> armsExercises = [
  // Home Biceps Exercises
  Exercise(
    name: "Reverse Push-Ups",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms", "Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Sit on the floor with your hands behind you, fingers pointing forward.  
    2. Press into your palms to lift your body slightly off the ground.  
    3. Slowly lower yourself down, engaging your biceps.  
    4. Push yourself back up and repeat.  
    """,
    commonMistakes: """
    1. Using your legs too much—focus on your arms.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Isometric Biceps Flex",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Stand upright and flex your biceps as hard as possible.  
    2. Hold the flexed position for 30-45 seconds.  
    3. Relax and repeat.  
    """,
    commonMistakes: """
    1. Not maintaining tension—keep your muscles engaged.  
    """,
    setsAndReps: "3 sets of 30-45 seconds",
    homeWorkout: true,
  ),

  // Gym Biceps Exercises
  Exercise(
    name: "Barbell Biceps Curl",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Barbell",
    instructions: """
    1. Hold a barbell with an underhand grip at shoulder-width.  
    2. Curl the barbell up towards your shoulders.  
    3. Lower it slowly back to the starting position.  
    """,
    commonMistakes: """
    1. Swinging your body—keep your core tight.  
    """,
    setsAndReps: "4 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Dumbbell Biceps Curl",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Dumbbells",
    instructions: """
    1. Hold a dumbbell in each hand, palms facing forward.  
    2. Curl both dumbbells up towards your shoulders.  
    3. Lower them slowly with control.  
    """,
    commonMistakes: """
    1. Using momentum instead of controlled motion.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Hammer Curl",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Dumbbells",
    instructions: """
    1. Hold a dumbbell in each hand with palms facing your torso.  
    2. Curl the dumbbells up while keeping wrists in a neutral position.  
    3. Lower them slowly to the starting position.  
    """,
    commonMistakes: """
    1. Moving your elbows forward—keep them stationary.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Preacher Curl",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Preacher Bench, Barbell/Dumbbell",
    instructions: """
    1. Sit on a preacher bench with your arms resting on the pad.  
    2. Hold a barbell or dumbbells with an underhand grip.  
    3. Curl the weight up, then lower it back down slowly.  
    """,
    commonMistakes: """
    1. Lifting too heavy—use a weight you can control.  
    """,
    setsAndReps: "3 sets of 12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Cable Biceps Curl",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Cable Machine",
    instructions: """
    1. Attach a straight bar to a cable machine at the lowest setting.  
    2. Hold the bar with an underhand grip and stand upright.  
    3. Curl the bar towards your shoulders, keeping elbows close to your body.  
    4. Slowly lower the bar back to the start.  
    """,
    commonMistakes: """
    1. Letting your elbows move forward—keep them stationary.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Incline Dumbbell Curl",
    targetMuscle: "Biceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Dumbbells, Incline Bench",
    instructions: """
    1. Sit on an incline bench with a dumbbell in each hand.  
    2. Let your arms hang fully extended before curling the weights up.  
    3. Lower them back down with control.  
    """,
    commonMistakes: """
    1. Moving too fast—slow and controlled reps are best.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),
    Exercise(
    name: "Triceps Dips (Bench or Floor)",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Shoulders", "Chest"],
    equipment: "Chair or No Equipment (Home-Friendly)",
    instructions: """
    1. Sit on the edge of a chair or bench with hands gripping the edge.  
    2. Slide off the seat, keeping your feet planted.  
    3. Lower your body by bending your elbows to 90 degrees.  
    4. Push yourself back up to the starting position.  
    """,
    commonMistakes: """
    1. Not keeping elbows close—keep them tucked in.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Diamond Push-Ups",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Chest", "Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Get into a push-up position with hands close together forming a diamond shape.  
    2. Lower your chest while keeping elbows tucked in.  
    3. Push back up to the starting position.  
    """,
    commonMistakes: """
    1. Letting elbows flare out—keep them close.  
    """,
    setsAndReps: "3 sets of 10-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Triceps Bodyweight Extensions",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Get into a forearm plank position with hands under shoulders.  
    2. Lower your forearms slowly to the ground.  
    3. Push back up, engaging your triceps.  
    """,
    commonMistakes: """
    1. Using shoulders instead of triceps—focus on arm movement.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: true,
  ),

  // Gym Triceps Exercises
  Exercise(
    name: "Close-Grip Bench Press",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Chest", "Shoulders"],
    equipment: "Barbell, Bench",
    instructions: """
    1. Lie on a bench and grip the barbell shoulder-width apart.  
    2. Lower the bar to your chest, keeping elbows close.  
    3. Press it back up while engaging your triceps.  
    """,
    commonMistakes: """
    1. Using too much weight—control is key.  
    """,
    setsAndReps: "4 sets of 8-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Triceps Rope Pushdown",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Cable Machine, Rope Attachment",
    instructions: """
    1. Attach a rope to the cable machine and hold it with both hands.  
    2. Pull the rope down while keeping elbows tight to your body.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Moving elbows—keep them stationary.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Skull Crushers",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Forearms"],
    equipment: "Barbell or Dumbbells, Bench",
    instructions: """
    1. Lie on a bench and hold a barbell or dumbbells above your head.  
    2. Lower the weight towards your forehead.  
    3. Extend your arms back up.  
    """,
    commonMistakes: """
    1. Moving your elbows—keep them fixed.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Overhead Dumbbell Extension",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Shoulders"],
    equipment: "Dumbbell",
    instructions: """
    1. Hold a dumbbell with both hands behind your head.  
    2. Extend your arms straight up.  
    3. Lower the dumbbell back behind your head.  
    """,
    commonMistakes: """
    1. Arching your back—keep your core tight.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Dumbbell Kickbacks",
    targetMuscle: "Triceps",
    secondaryMuscles: ["Rear Delt of Shoulder"],
    equipment: "Dumbbells",
    instructions: """
    1. Bend slightly forward with dumbbells in both hands.  
    2. Extend your arms straight back, keeping elbows tight.  
    3. Slowly return to the starting position.  
    """,
    commonMistakes: """
    1. Dropping your elbows—keep them stationary.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),
   Exercise(
    name: "Wrist Flexion & Extension",
    targetMuscle: "Forearms",
    secondaryMuscles: ["Wrists"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Place your forearm on a flat surface with your hand hanging off the edge.  
    2. Flex your wrist upward, then slowly lower it down.  
    3. Repeat for both flexion and extension.  
    """,
    commonMistakes: """
    1. Rushing—perform slow and controlled reps.  
    """,
    setsAndReps: "3 sets of 15-20 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Finger Squeeze & Hold",
    targetMuscle: "Forearms",
    secondaryMuscles: ["Grip Strength"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Squeeze your fingers into a tight fist and hold for 10 seconds.  
    2. Slowly release and repeat.  
    """,
    commonMistakes: """
    1. Not applying enough tension—squeeze tightly.  
    """,
    setsAndReps: "3 sets of 10-second holds",
    homeWorkout: true,
  ),

  // Gym Forearm Exercises
  Exercise(
    name: "Wrist Curls",
    targetMuscle: "Forearms",
    secondaryMuscles: ["Wrists"],
    equipment: "Dumbbells or Barbell",
    instructions: """
    1. Hold a dumbbell with palms facing up.  
    2. Rest your forearms on a bench and curl your wrists upward.  
    3. Lower back down slowly.  
    """,
    commonMistakes: """
    1. Lifting too heavy—use controlled motion.  
    """,
    setsAndReps: "3 sets of 15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Reverse Wrist Curls",
    targetMuscle: "Forearms",
    secondaryMuscles: ["Wrists"],
    equipment: "Dumbbells or Barbell",
    instructions: """
    1. Hold a dumbbell with palms facing down.  
    2. Rest your forearms on a bench and extend your wrists upward.  
    3. Lower back down slowly.  
    """,
    commonMistakes: """
    1. Using too much weight—focus on form.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Farmer’s Walk",
    targetMuscle: "Forearms",
    secondaryMuscles: ["Grip Strength"],
    equipment: "Heavy Dumbbells",
    instructions: """
    1. Hold a heavy dumbbell in each hand.  
    2. Walk for 30-60 seconds while maintaining a strong grip.  
    """,
    commonMistakes: """
    1. Rounding your shoulders—keep them back.  
    """,
    setsAndReps: "3 sets of 30-60 seconds",
    homeWorkout: false,
  ),
];
