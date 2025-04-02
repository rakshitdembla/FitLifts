import '../../../models/exercise.dart';

List<Exercise> absExercises = [
  Exercise(
    name: "Crunches",
    targetMuscle: "Abs",
    secondaryMuscles: ["Side Abs"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with your knees bent and feet flat on the floor.  
    2. Place your hands lightly behind your head without pulling your neck.  
    3. Engage your core and lift your upper body towards your knees.  
    4. Pause briefly at the top, then lower back down slowly.  
    5. Repeat while maintaining controlled movements.  
    """,
    commonMistakes: """
    1. Pulling your neck with your hands—keep your neck relaxed.  
    2. Using momentum instead of engaging your abs—lift with control.  
    """,
    setsAndReps: "3 sets of 15-20 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Leg Raises",
    targetMuscle: "Lower Abs",
    secondaryMuscles: ["Hip Flexors"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie flat on your back with your legs extended and hands under your hips.  
    2. Keep your legs straight and lift them up towards the ceiling.  
    3. Slowly lower your legs back down without touching the ground.  
    4. Repeat the movement while keeping your core tight.  
    """,
    commonMistakes: """
    1. Arching your lower back—keep your back flat on the floor.  
    2. Dropping legs too fast—lower them with control.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Plank",
    targetMuscle: "Core",
    secondaryMuscles: ["Shoulders", "Lower Back"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Get into a push-up position but rest on your forearms.  
    2. Keep your body in a straight line from head to heels.  
    3. Engage your core and hold this position.  
    4. Avoid letting your hips drop or rise too high.  
    """,
    commonMistakes: """
    1. Arching or sagging your lower back—keep your body aligned.  
    2. Holding your breath—breathe normally throughout.  
    """,
    setsAndReps: "3 sets of 30-60 seconds",
    homeWorkout: true,
  ),

  Exercise(
    name: "Bicycle Crunches",
    targetMuscle: "Side Abs",
    secondaryMuscles: ["Upper Abs", "Lower Abs"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with hands behind your head and legs lifted.  
    2. Bring your right elbow towards your left knee while extending the right leg.  
    3. Switch sides, bringing the left elbow towards the right knee.  
    4. Keep alternating in a pedaling motion.  
    """,
    commonMistakes: """
    1. Moving too fast—focus on controlled movements.  
    2. Pulling your neck—let your core do the work.  
    """,
    setsAndReps: "3 sets of 20 reps (10 per side)",
    homeWorkout: true,
  ),

  Exercise(
    name: "Russian Twists",
    targetMuscle: "Side Abs",
    secondaryMuscles: ["Core"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Sit on the floor with knees bent and feet slightly raised.  
    2. Lean back slightly and clasp your hands together.  
    3. Twist your torso to the right, then to the left.  
    4. Keep your movements controlled and engage your core.  
    """,
    commonMistakes: """
    1. Using only your arms—rotate from your core.  
    2. Rushing—focus on slow, controlled twists.  
    """,
    setsAndReps: "3 sets of 20 reps (10 per side)",
    homeWorkout: true,
  ),

  Exercise(
    name: "Reverse Crunches",
    targetMuscle: "Lower Abs",
    secondaryMuscles: ["Core"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with knees bent and feet off the ground.  
    2. Lift your hips off the floor by bringing your knees toward your chest.  
    3. Lower back down slowly with control.  
    4. Keep your core engaged throughout the movement.  
    """,
    commonMistakes: """
    1. Swinging your legs—use controlled movement.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Mountain Climbers",
    targetMuscle: "Core",
    secondaryMuscles: ["Lower Abs", "Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Get into a push-up position with arms straight.  
    2. Bring one knee towards your chest, then quickly switch legs.  
    3. Keep a steady pace while keeping your back straight.  
    """,
    commonMistakes: """
    1. Lifting hips too high—keep your body aligned.  
    """,
    setsAndReps: "3 sets of 30 seconds",
    homeWorkout: true,
  ),

  Exercise(
    name: "Toe Touches",
    targetMuscle: "Upper Abs",
    secondaryMuscles: ["Core"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with your legs extended upwards.  
    2. Reach your hands towards your toes while lifting your upper body.  
    3. Lower back down with control.  
    """,
    commonMistakes: """
    1. Using momentum instead of core strength.  
    """,
    setsAndReps: "3 sets of 15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Flutter Kicks",
    targetMuscle: "Lower Abs",
    secondaryMuscles: ["Hip Flexors"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with legs extended.  
    2. Lift your legs slightly off the floor and alternate kicking up and down.  
    3. Keep your lower back flat on the ground.  
    """,
    commonMistakes: """
    1. Letting lower back arch—keep it pressed down.  
    """,
    setsAndReps: "3 sets of 20 seconds",
    homeWorkout: true,
  ),

  Exercise(
    name: "Dead Bug",
    targetMuscle: "Core",
    secondaryMuscles: ["Lower Abs"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with arms and legs raised.  
    2. Lower one arm and the opposite leg while keeping your core tight.  
    3. Return to the start and switch sides.  
    """,
    commonMistakes: """
    1. Arching your back—engage your abs.  
    """,
    setsAndReps: "3 sets of 10 reps per side",
    homeWorkout: true,
  ),
  Exercise(
    name: "V-Ups",
    targetMuscle: "Abs",
    secondaryMuscles: ["Side Abs"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie flat on your back with legs extended and arms overhead.  
    2. Lift your upper body and legs simultaneously to form a "V" shape.  
    3. Lower back down slowly with control.  
    """,
    commonMistakes: """
    1. Using momentum—engage your core for a controlled lift.  
    """,
    setsAndReps: "3 sets of 12 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Side Plank",
    targetMuscle: "Side Abs",
    secondaryMuscles: ["Core", "Shoulders"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your side with your elbow directly under your shoulder.  
    2. Lift your hips off the ground, keeping your body straight.  
    3. Hold the position while engaging your core.  
    """,
    commonMistakes: """
    1. Dropping hips—keep them aligned with your body.  
    """,
    setsAndReps: "3 sets of 30 seconds per side",
    homeWorkout: true,
  ),

  Exercise(
    name: "Seated Knee Tucks",
    targetMuscle: "Lower Abs",
    secondaryMuscles: ["Core"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Sit on the floor with your legs extended and hands behind you for support.  
    2. Bring your knees toward your chest while leaning slightly back.  
    3. Extend your legs back out without touching the floor.  
    """,
    commonMistakes: """
    1. Not controlling the movement—avoid jerky motions.  
    """,
    setsAndReps: "3 sets of 15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Hollow Hold",
    targetMuscle: "Core",
    secondaryMuscles: ["Abs"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with arms extended overhead and legs straight.  
    2. Lift your arms, shoulders, and legs slightly off the ground.  
    3. Hold the position while keeping your core engaged.  
    """,
    commonMistakes: """
    1. Letting lower back arch—keep it pressed against the floor.  
    """,
    setsAndReps: "3 sets of 20-30 seconds",
    homeWorkout: true,
  ),

  Exercise(
    name: "Hanging Knee Raises",
    targetMuscle: "Lower Abs",
    secondaryMuscles: ["Core"],
    equipment: "Pull-Up Bar",
    instructions: """
    1. Hang from a pull-up bar with an overhand grip.  
    2. Engage your core and lift your knees toward your chest.  
    3. Lower back down slowly with control.  
    """,
    commonMistakes: """
    1. Swinging legs—keep the movement controlled.  
    """,
    setsAndReps: "3 sets of 12 reps",
    homeWorkout: true,
  ),
];
