import '../../../models/exercise.dart';

List<Exercise> cardioExercises = [
  // Gym-Based Cardio (2 Exercises)
  Exercise(
    name: "Cycling (Stationary Bike)",
    targetMuscle: "Legs",
    secondaryMuscles: ["Glutes", "Calves"],
    equipment: "Stationary Bike",
    instructions: """
    1. Adjust the seat height so your legs are slightly bent at the bottom of the pedal stroke.  
    2. Start pedaling at a steady pace, keeping your core engaged.  
    3. Increase resistance or speed for a more intense workout.  
    """,
    commonMistakes: """
    1. Slouching—keep your back straight and core engaged.  
    """,
    setsAndReps: "20-30 minutes at moderate intensity",
    homeWorkout: false,
  ),

  Exercise(
    name: "Treadmill Running",
    targetMuscle: "Legs",
    secondaryMuscles: ["Glutes", "Calves"],
    equipment: "Treadmill",
    instructions: """
    1. Start by walking at a slow pace to warm up.  
    2. Gradually increase the speed to a jog or run.  
    3. Maintain good posture and avoid holding onto the handrails.  
    """,
    commonMistakes: """
    1. Holding onto the handrails—this reduces the effectiveness of the workout.  
    """,
    setsAndReps: "20-30 minutes at moderate intensity",
    homeWorkout: false,
  ),

  // Home/Outdoor Cardio (10 Exercises)
  Exercise(
    name: "Jump Rope",
    targetMuscle: "Legs",
    secondaryMuscles: ["Calves", "Core"],
    equipment: "Jump Rope",
    instructions: """
    1. Hold the jump rope handles and swing it over your head.  
    2. Jump over the rope as it comes under your feet.  
    3. Maintain a steady rhythm and increase speed for intensity.  
    """,
    commonMistakes: """
    1. Jumping too high—keep jumps low and efficient.  
    """,
    setsAndReps: "3 sets of 1-2 minutes",
    homeWorkout: true,
  ),

  Exercise(
    name: "High Knees",
    targetMuscle: "Legs",
    secondaryMuscles: ["Core", "Glutes"],
    equipment: "No Equipment",
    instructions: """
    1. Stand upright and run in place, bringing your knees up to hip level.  
    2. Pump your arms for added intensity.  
    3. Maintain a fast pace for the duration of the exercise.  
    """,
    commonMistakes: """
    1. Slouching—keep your back straight and core engaged.  
    """,
    setsAndReps: "3 sets of 30-60 seconds",
    homeWorkout: true,
  ),

  Exercise(
    name: "Burpees",
    targetMuscle: "Full Body",
    secondaryMuscles: ["Legs", "Core"],
    equipment: "No Equipment",
    instructions: """
    1. Start in a standing position, then drop into a squat and place your hands on the ground.  
    2. Kick your feet back into a plank position, then return to the squat.  
    3. Jump explosively into the air with your arms raised.  
    """,
    commonMistakes: """
    1. Skipping the jump—complete the full movement for maximum benefit.  
    """,
    setsAndReps: "3 sets of 10-15 reps",
    homeWorkout: true,
  ),

  Exercise(
    name: "Mountain Climbers",
    targetMuscle: "Core",
    secondaryMuscles: ["Legs", "Shoulders"],
    equipment: "No Equipment",
    instructions: """
    1. Start in a plank position with your hands under your shoulders.  
    2. Drive one knee towards your chest, then quickly switch legs.  
    3. Maintain a fast pace for the duration of the exercise.  
    """,
    commonMistakes: """
    1. Letting your hips sag—keep your body in a straight line.  
    """,
    setsAndReps: "3 sets of 30-60 seconds",
    homeWorkout: true,
  ),

  Exercise(
    name: "Jumping Jacks",
    targetMuscle: "Legs",
    secondaryMuscles: ["Shoulders", "Core"],
    equipment: "No Equipment",
    instructions: """
    1. Stand upright with your feet together and arms at your sides.  
    2. Jump while spreading your legs and raising your arms above your head.  
    3. Return to the starting position and repeat.  
    """,
    commonMistakes: """
    1. Landing heavily—absorb the impact with your legs.  
    """,
    setsAndReps: "3 sets of 30-60 seconds",
    homeWorkout: true,
  ),

  Exercise(
    name: "Running (Outdoor)",
    targetMuscle: "Legs",
    secondaryMuscles: ["Glutes", "Calves"],
    equipment: "No Equipment",
    instructions: """
    1. Start with a light jog to warm up.  
    2. Gradually increase your speed to a comfortable running pace.  
    3. Maintain good posture and breathe steadily.  
    """,
    commonMistakes: """
    1. Overstriding—take shorter, quicker steps to avoid injury.  
    """,
    setsAndReps: "20-30 minutes at moderate intensity",
    homeWorkout: true,
  ),

  Exercise(
    name: "Stair Climbing",
    targetMuscle: "Legs",
    secondaryMuscles: ["Glutes", "Calves"],
    equipment: "Stairs",
    instructions: """
    1. Find a set of stairs and climb them at a steady pace.  
    2. Use your legs to push yourself up, not your hands on the railing.  
    3. Descend carefully and repeat.  
    """,
    commonMistakes: """
    1. Relying on the railing—use your legs for the majority of the work.  
    """,
    setsAndReps: "3 sets of 5-10 minutes",
    homeWorkout: true,
  ),

  Exercise(
    name: "Shadow Boxing",
    targetMuscle: "Upper Body",
    secondaryMuscles: ["Core", "Legs"],
    equipment: "No Equipment",
    instructions: """
    1. Stand in a boxing stance with your feet shoulder-width apart.  
    2. Throw punches in the air, alternating between jabs, crosses, and hooks.  
    3. Move around and incorporate footwork for added intensity.  
    """,
    commonMistakes: """
    1. Overextending your arms—keep your punches controlled.  
    """,
    setsAndReps: "3 sets of 1-2 minutes",
    homeWorkout: true,
  ),

  Exercise(
    name: "Sprints",
    targetMuscle: "Legs",
    secondaryMuscles: ["Glutes", "Calves"],
    equipment: "No Equipment",
    instructions: """
    1. Find an open space and mark a starting point.  
    2. Sprint as fast as you can for 20-30 meters.  
    3. Walk back to the starting point and repeat.  
    """,
    commonMistakes: """
    1. Starting too fast—pace yourself to avoid burnout.  
    """,
    setsAndReps: "5-10 sprints",
    homeWorkout: true,
  ),

  Exercise(
    name: "Dancing",
    targetMuscle: "Full Body",
    secondaryMuscles: ["Legs", "Core"],
    equipment: "No Equipment",
    instructions: """
    1. Play your favorite music and start moving to the beat.  
    2. Incorporate a variety of movements like jumps, twists, and steps.  
    3. Keep the intensity high for a full cardio workout.  
    """,
    commonMistakes: """
    1. Staying in one spot—move around to engage more muscles.  
    """,
    setsAndReps: "20-30 minutes",
    homeWorkout: true,
  ),

  Exercise(
    name: "Side Shuffles",
    targetMuscle: "Legs",
    secondaryMuscles: ["Glutes", "Calves"],
    equipment: "No Equipment",
    instructions: """
    1. Stand with your feet shoulder-width apart and knees slightly bent.  
    2. Shuffle to the side by taking quick steps, keeping your body low.  
    3. Switch directions and repeat.  
    """,
    commonMistakes: """
    1. Standing too upright—keep your knees bent for better engagement.  
    """,
    setsAndReps: "3 sets of 30-60 seconds",
    homeWorkout: true,
  ),
];