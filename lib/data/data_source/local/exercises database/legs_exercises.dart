import '../../../models/exercise.dart';

List<Exercise> legExercises = [
  // Home Workouts (6 Exercises)
  Exercise(
    name: "Bodyweight Squats",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Stand with your feet shoulder-width apart.  
    2. Lower your body by bending your knees and hips, keeping your chest up.  
    3. Push through your heels to return to the starting position.  
    """,
    commonMistakes: """
    1. Letting your knees cave in—keep them aligned with your toes.  
    """,
    setsAndReps: "3 sets of 15-20 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Lunges",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Stand upright and take a step forward with one leg.  
    2. Lower your body until both knees are at 90-degree angles.  
    3. Push back to the starting position and switch legs.  
    """,
    commonMistakes: """
    1. Leaning too far forward—keep your torso upright.  
    """,
    setsAndReps: "3 sets of 10-12 reps per leg",
    homeWorkout: true,
  ),

  Exercise(
    name: "Glute Bridges",
    targetMuscle: "Glutes",
    secondaryMuscles: ["Hamstrings", "Lower Back"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Lie on your back with your knees bent and feet flat on the floor.  
    2. Lift your hips off the ground by squeezing your glutes.  
    3. Lower your hips back down with control.  
    """,
    commonMistakes: """
    1. Overarching your lower back—engage your core.  
    """,
    setsAndReps: "3 sets of 15-20 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Step-Ups",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Sturdy Chair or Step (Home-Friendly)",
    instructions: """
    1. Stand in front of a sturdy chair or step.  
    2. Step onto it with one leg and push through your heel to lift your body up.  
    3. Step back down and switch legs.  
    """,
    commonMistakes: """
    1. Using momentum—focus on controlled movements.  
    """,
    setsAndReps: "3 sets of 10-12 reps per leg",
    homeWorkout: true,
  ),

  Exercise(
    name: "Calf Raises",
    targetMuscle: "Calves",
    secondaryMuscles: ["None"],
    equipment: "No Equipment (Home-Friendly)",
    instructions: """
    1. Stand upright with your feet shoulder-width apart.  
    2. Raise your heels off the ground, squeezing your calves.  
    3. Lower your heels back down slowly.  
    """,
    commonMistakes: """
    1. Bouncing—use controlled movements.  
    """,
    setsAndReps: "3 sets of 20-25 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Wall Sit",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes"],
    equipment: "Wall (Home-Friendly)",
    instructions: """
    1. Lean against a wall with your back flat and slide down until your knees are at 90 degrees.  
    2. Hold the position for the desired time.  
    3. Push through your heels to stand back up.  
    """,
    commonMistakes: """
    1. Letting your knees go past your toes—keep them aligned.  
    """,
    setsAndReps: "3 sets of 30-60 seconds hold",
    homeWorkout: true,
  ),

  // Gym Workouts (19 Exercises)
  Exercise(
    name: "Barbell Squats",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Barbell",
    instructions: """
    1. Stand with your feet shoulder-width apart and a barbell on your upper back.  
    2. Lower your body by bending your knees and hips, keeping your chest up.  
    3. Push through your heels to return to the starting position.  
    """,
    commonMistakes: """
    1. Rounding your back—keep it neutral.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Leg Press",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Leg Press Machine",
    instructions: """
    1. Sit on the leg press machine and place your feet shoulder-width apart on the platform.  
    2. Push the platform away by extending your legs.  
    3. Lower the platform back down with control.  
    """,
    commonMistakes: """
    1. Locking your knees—keep a slight bend at the top.  
    """,
    setsAndReps: "4 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Romanian Deadlift",
    targetMuscle: "Hamstrings",
    secondaryMuscles: ["Glutes", "Lower Back"],
    equipment: "Barbell",
    instructions: """
    1. Stand with your feet hip-width apart and hold a barbell in front of your thighs.  
    2. Hinge at your hips to lower the barbell, keeping your back straight.  
    3. Return to the starting position by squeezing your glutes.  
    """,
    commonMistakes: """
    1. Rounding your back—keep it neutral.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Leg Curls",
    targetMuscle: "Hamstrings",
    secondaryMuscles: ["Calves"],
    equipment: "Leg Curl Machine",
    instructions: """
    1. Lie face down on the leg curl machine and hook your ankles under the padded lever.  
    2. Curl your legs up towards your glutes.  
    3. Lower your legs back down with control.  
    """,
    commonMistakes: """
    1. Using momentum—focus on controlled movements.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Leg Extensions",
    targetMuscle: "Quads",
    secondaryMuscles: ["None"],
    equipment: "Leg Extension Machine",
    instructions: """
    1. Sit on the leg extension machine and place your ankles under the padded lever.  
    2. Extend your legs until they are straight.  
    3. Lower the weight back down with control.  
    """,
    commonMistakes: """
    1. Locking your knees—keep a slight bend at the top.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Hack Squat",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Hack Squat Machine",
    instructions: """
    1. Stand on the hack squat machine with your back against the pad.  
    2. Lower your body by bending your knees and hips.  
    3. Push through your heels to return to the starting position.  
    """,
    commonMistakes: """
    1. Letting your knees cave in—keep them aligned with your toes.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Bulgarian Split Squats",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Dumbbells, Bench",
    instructions: """
    1. Stand in front of a bench and place one foot behind you on the bench.  
    2. Lower your body until your front thigh is parallel to the ground.  
    3. Push through your front heel to return to the starting position.  
    """,
    commonMistakes: """
    1. Leaning too far forward—keep your torso upright.  
    """,
    setsAndReps: "3 sets of 10-12 reps per leg",
    homeWorkout: false,
  ),

  Exercise(
    name: "Calf Raises (Machine)",
    targetMuscle: "Calves",
    secondaryMuscles: ["None"],
    equipment: "Calf Raise Machine",
    instructions: """
    1. Stand on the calf raise machine with your shoulders under the pads.  
    2. Raise your heels off the ground, squeezing your calves.  
    3. Lower your heels back down slowly.  
    """,
    commonMistakes: """
    1. Bouncing—use controlled movements.  
    """,
    setsAndReps: "4 sets of 15-20 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Hip Thrusts",
    targetMuscle: "Glutes",
    secondaryMuscles: ["Hamstrings", "Lower Back"],
    equipment: "Barbell, Bench",
    instructions: """
    1. Sit on the ground with your upper back against a bench and a barbell over your hips.  
    2. Drive through your heels to lift your hips until your body forms a straight line.  
    3. Lower your hips back down with control.  
    """,
    commonMistakes: """
    1. Overarching your lower back—engage your core.  
    """,
    setsAndReps: "4 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Walking Lunges",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Dumbbells",
    instructions: """
    1. Hold dumbbells in each hand and step forward with one leg.  
    2. Lower your body until both knees are at 90-degree angles.  
    3. Push through your front heel and step forward with the other leg.  
    """,
    commonMistakes: """
    1. Leaning too far forward—keep your torso upright.  
    """,
    setsAndReps: "3 sets of 12-15 reps per leg",
    homeWorkout: false,
  ),

  Exercise(
    name: "Sumo Deadlift",
    targetMuscle: "Glutes",
    secondaryMuscles: ["Hamstrings", "Quads"],
    equipment: "Barbell",
    instructions: """
    1. Stand with your feet wider than shoulder-width apart and toes pointed out.  
    2. Bend at the hips and knees to grip the barbell with both hands.  
    3. Lift the barbell by extending your hips and knees.  
    4. Lower the barbell back down with control.  
    """,
    commonMistakes: """
    1. Rounding your back—keep it neutral.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Seated Calf Raises",
    targetMuscle: "Calves",
    secondaryMuscles: ["None"],
    equipment: "Seated Calf Raise Machine",
    instructions: """
    1. Sit on the calf raise machine and place your knees under the pads.  
    2. Raise your heels off the ground, squeezing your calves.  
    3. Lower your heels back down slowly.  
    """,
    commonMistakes: """
    1. Bouncing—use controlled movements.  
    """,
    setsAndReps: "4 sets of 15-20 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Front Squats",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Barbell",
    instructions: """
    1. Hold a barbell across the front of your shoulders with your elbows high.  
    2. Lower your body by bending your knees and hips, keeping your chest up.  
    3. Push through your heels to return to the starting position.  
    """,
    commonMistakes: """
    1. Letting your elbows drop—keep them high.  
    """,
    setsAndReps: "4 sets of 8-10 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Good Mornings",
    targetMuscle: "Hamstrings",
    secondaryMuscles: ["Glutes", "Lower Back"],
    equipment: "Barbell",
    instructions: """
    1. Stand with your feet shoulder-width apart and a barbell on your upper back.  
    2. Hinge at your hips to lower your torso until it's parallel to the ground.  
    3. Return to the starting position by squeezing your glutes.  
    """,
    commonMistakes: """
    1. Rounding your back—keep it neutral.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Box Jumps",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Calves"],
    equipment: "Plyo Box",
    instructions: """
    1. Stand in front of a sturdy box or platform.  
    2. Jump onto the box, landing softly with both feet.  
    3. Step back down and repeat.  
    """,
    commonMistakes: """
    1. Landing hard—absorb the impact with your legs.  
    """,
    setsAndReps: "3 sets of 10-12 reps",
    homeWorkout: false,
  ),

  Exercise(
    name: "Step-Back Lunges",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "Dumbbells",
    instructions: """
    1. Hold dumbbells in each hand and step back with one leg.  
    2. Lower your body until both knees are at 90-degree angles.  
    3. Push through your front heel to return to the starting position.  
    """,
    commonMistakes: """
    1. Leaning too far forward—keep your torso upright.  
    """,
    setsAndReps: "3 sets of 10-12 reps per leg",
    homeWorkout: false,
  ),

  Exercise(
    name: "Pistol Squats",
    targetMuscle: "Quads",
    secondaryMuscles: ["Glutes", "Hamstrings"],
    equipment: "No Equipment",
    instructions: """
    1. Stand on one leg and extend the other leg forward.  
    2. Lower your body by bending your standing leg, keeping your chest up.  
    3. Push through your heel to return to the starting position.  
    """,
    commonMistakes: """
    1. Letting your knee cave in—keep it aligned with your toes.  
    """,
    setsAndReps: "3 sets of 6-8 reps per leg",
    homeWorkout: false,
  ),

  Exercise(
    name: "Sissy Squats",
    targetMuscle: "Quads",
    secondaryMuscles: ["None"],
    equipment: "No Equipment",
    instructions: """
    1. Stand upright and hold onto a sturdy object for balance.  
    2. Lower your body by bending your knees and leaning back slightly.  
    3. Push through your toes to return to the starting position.  
    """,
    commonMistakes: """
    1. Letting your knees go past your toes—keep them aligned.  
    """,
    setsAndReps: "3 sets of 12-15 reps",
    homeWorkout: false,
  ),
];