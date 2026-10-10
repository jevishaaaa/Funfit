import SwiftUI

// MARK: - Models
enum ExerciseTier: String, CaseIterable, Identifiable {
    case elderly = "Elderly Tier"
    case adult = "Adult Tier"
    case kid = "Kid Tier"
    
    var id: String { self.rawValue }
    var subtitle: String {
        switch self {
        case .elderly: return "Balance & Fall-Prevention Focus"
        case .adult: return "Back-Care & General Fitness"
        case .kid: return "Guideline-Based Play & Fun"
        }
    }
}

struct ExerciseItem: Identifiable {
    let id = UUID()
    let name: String
    let tier: ExerciseTier
    let tag: String
    let obstacle: String
    let cameraCheck: String
    let howTo: String
    let prevents: String
    let fitnessBenefit: String
    let imageName: String // Name of the asset in your Asset Catalog
}

// MARK: - Exercise Repository
struct ExerciseRepository {
    static let exercises: [ExerciseItem] = [
        // MARK: Elderly Tier
        ExerciseItem(
            name: "Marching (Warm-up / Cool-down)",
            tier: .elderly,
            tag: "🟢",
            obstacle: "Gentle rolling path",
            cameraCheck: "Knees alternating",
            howTo: "March in place slowly, lifting knees comfortably while keeping an upright posture.",
            prevents: "Stiff joints and sudden balance slips.",
            fitnessBenefit: "Improves cardiovascular rhythm and warms up lower limbs.",
            imageName: "elderly_marching"
        ),
        ExerciseItem(
            name: "Toe Raises",
            tier: .elderly,
            tag: "🟢",
            obstacle: "Low double-bar",
            cameraCheck: "Ankle shifts slightly (subtle)",
            howTo: "Stand tall and rise up onto your toes, then gently lower back down.",
            prevents: "Ankle weakness and trips on uneven surfaces.",
            fitnessBenefit: "Strengthens calves and ankle stability.",
            imageName: "elderly_toe_raises"
        ),
        ExerciseItem(
            name: "Heel (Calf) Raises",
            tier: .elderly,
            tag: "🟢",
            obstacle: "Low double-bar",
            cameraCheck: "Ankles lift slightly (subtle)",
            howTo: "Lift your toes off the ground while keeping your weight on your heels.",
            prevents: "Shin splints and forward falls.",
            fitnessBenefit: "Builds lower leg balance and shin strength.",
            imageName: "elderly_heel_raises"
        ),
        ExerciseItem(
            name: "Knee Bends",
            tier: .elderly,
            tag: "🟡",
            obstacle: "Low bar",
            cameraCheck: "Small hip drop",
            howTo: "Perform a shallow knee bend, keeping support nearby if needed.",
            prevents: "Quadriceps atrophy and knee locking.",
            fitnessBenefit: "Builds functional leg strength for daily standing tasks.",
            imageName: "elderly_knee_bends"
        ),
        ExerciseItem(
            name: "Sideways Walking",
            tier: .elderly,
            tag: "🟡",
            obstacle: "Left/right hurdles",
            cameraCheck: "Ankles shift sideways",
            howTo: "Take controlled steps sideways without crossing your feet.",
            prevents: "Lateral instability and side-fall injuries.",
            fitnessBenefit: "Strengthens hip abductors and lateral stability.",
            imageName: "elderly_sideways_walking"
        ),
        ExerciseItem(
            name: "Tandem Stance (Hold)",
            tier: .elderly,
            tag: "🟡",
            obstacle: "Narrow plank",
            cameraCheck: "Ankles close, body still",
            howTo: "Place one foot directly in front of the other, heel-to-toe, and hold steady.",
            prevents: "Loss of balance during complex walking turns.",
            fitnessBenefit: "Enhances proprioception and core stabilizing coordination.",
            imageName: "elderly_tandem_stance"
        ),
        ExerciseItem(
            name: "One-Leg Stand (Hold)",
            tier: .elderly,
            tag: "🟡",
            obstacle: "Stepping stone",
            cameraCheck: "One ankle raised, held",
            howTo: "Lift one foot slightly off the ground and hold your balance.",
            prevents: "Severe fall-related hip fractures.",
            fitnessBenefit: "Maximizes single-leg balance and core engagement.",
            imageName: "elderly_one_leg_stand"
        ),
        ExerciseItem(
            name: "Sit-to-Stand",
            tier: .elderly,
            tag: "🟡",
            obstacle: "Soft step-up",
            cameraCheck: "Hip drops and rises (chair in frame)",
            howTo: "Rise smoothly from a seated position to standing without using hands if possible.",
            prevents: "Loss of independent mobility.",
            fitnessBenefit: "Strengthens glutes, thighs, and core stability.",
            imageName: "elderly_sit_to_stand"
        ),
        ExerciseItem(
            name: "Forward Reach",
            tier: .elderly,
            tag: "🟡",
            obstacle: "Floating target",
            cameraCheck: "Wrist extends forward",
            howTo: "Extend one arm forward gently while maintaining a stable base.",
            prevents: "Forward tipping instability when reaching for objects.",
            fitnessBenefit: "Improves upper body coordination and dynamic balance.",
            imageName: "elderly_forward_reach"
        ),
        ExerciseItem(
            name: "Step-Touch",
            tier: .elderly,
            tag: "⚪",
            obstacle: "Alternating stones",
            cameraCheck: "Ankles tap side to side",
            howTo: "Step to the side and bring the other foot to tap alongside it, alternating directions.",
            prevents: "Foot drag and shuffling gait.",
            fitnessBenefit: "Promotes rhythmic agility and coordination.",
            imageName: "elderly_step_touch"
        ),
        ExerciseItem(
            name: "Arm Raises, Shoulder Rolls & Side Reaches",
            tier: .elderly,
            tag: "⚪",
            obstacle: "Arm/shoulder pathway",
            cameraCheck: "Upper body mobility check",
            howTo: "Perform slow, controlled shoulder rolls and gentle overhead or side reaches.",
            prevents: "Frozen shoulder and upper back stiffness.",
            fitnessBenefit: "Keeps upper body joints lubricated and mobile.",
            imageName: "elderly_arm_raises"
        ),

        // MARK: Adult Tier
        ExerciseItem(
            name: "Marching (Warm-up / Cool-down)",
            tier: .adult,
            tag: "⚪",
            obstacle: "Rolling path",
            cameraCheck: "Knees alternating",
            howTo: "Active march in place with high energy.",
            prevents: "Muscle pulls during higher-intensity movements.",
            fitnessBenefit: "Elevates heart rate and primes joints.",
            imageName: "adult_marching"
        ),
        ExerciseItem(
            name: "Hip Hinge",
            tier: .adult,
            tag: "🔵",
            obstacle: "Gentle slope",
            cameraCheck: "Shoulders forward/down, hips back",
            howTo: "Push hips backward with a soft bend in the knees, keeping your back straight.",
            prevents: "Lower back strain from improper lifting mechanics.",
            fitnessBenefit: "Strengthens posterior chain, hamstrings, and glutes.",
            imageName: "adult_hip_hinge"
        ),
        ExerciseItem(
            name: "Standing Hip Extension",
            tier: .adult,
            tag: "🔵",
            obstacle: "Low sweeping bar",
            cameraCheck: "Leg swings back",
            howTo: "Keep your torso steady and extend one leg straight back behind you.",
            prevents: "Lower back fatigue and weak glute activation.",
            fitnessBenefit: "Tones glutes and supports spinal alignment.",
            imageName: "adult_hip_extension"
        ),
        ExerciseItem(
            name: "Torso Rotations",
            tier: .adult,
            tag: "🔵",
            obstacle: "Alternating side gates",
            cameraCheck: "Shoulders turn",
            howTo: "Gently rotate your torso from side to side with a stable lower body.",
            prevents: "Spinal stiffness and oblique muscle tightness.",
            fitnessBenefit: "Improves core rotational mobility and posture.",
            imageName: "adult_torso_rotations"
        ),
        ExerciseItem(
            name: "Squats",
            tier: .adult,
            tag: "🔵",
            obstacle: "Horizontal bar",
            cameraCheck: "Hips drop",
            howTo: "Lower your hips back and down as if sitting in a chair, keeping chest up.",
            prevents: "Knee misalignment and weak lower body strength.",
            fitnessBenefit: "Comprehensive lower body muscle conditioning.",
            imageName: "adult_squats"
        ),
        ExerciseItem(
            name: "Reverse Lunges",
            tier: .adult,
            tag: "🔵",
            obstacle: "Staggered platform",
            cameraCheck: "One knee drops, other leg back",
            howTo: "Step backward with one leg and lower your hips until both knees are bent at 90 degrees.",
            prevents: "Knee stress and muscular imbalances.",
            fitnessBenefit: "Builds single-leg stability and core strength.",
            imageName: "adult_reverse_lunges"
        ),
        ExerciseItem(
            name: "Side Reaches",
            tier: .adult,
            tag: "🔵",
            obstacle: "Floating side targets",
            cameraCheck: "Wrist reaches overhead and over",
            howTo: "Reach one arm up and curve your torso to the side.",
            prevents: "Side body tightness and restricted ribcage mobility.",
            fitnessBenefit: "Lengthens obliques and enhances spinal flexibility.",
            imageName: "adult_side_reaches"
        ),
        ExerciseItem(
            name: "High Knees",
            tier: .adult,
            tag: "⚪",
            obstacle: "Low hurdle",
            cameraCheck: "Knees high and fast",
            howTo: "Drive knees up rapidly toward your chest in a running motion.",
            prevents: "Sluggish lower-body circulation.",
            fitnessBenefit: "Boosts cardiovascular endurance and hip flexor strength.",
            imageName: "adult_high_knees"
        ),
        ExerciseItem(
            name: "Skater Steps",
            tier: .adult,
            tag: "⚪",
            obstacle: "Alternating side hurdles",
            cameraCheck: "Hips shift side to side",
            howTo: "Leap sideways from one foot to the other in a skating motion.",
            prevents: "Lateral ankle sprains and weak stabilizers.",
            fitnessBenefit: "Enhances agility and lateral power.",
            imageName: "adult_skater_steps"
        ),
        ExerciseItem(
            name: "Jumping Jacks",
            tier: .adult,
            tag: "⚪",
            obstacle: "Wide gate",
            cameraCheck: "Wrists up, ankles apart",
            howTo: "Jump feet out while swinging arms overhead, then return.",
            prevents: "Sedentary stiffness.",
            fitnessBenefit: "Full-body aerobic conditioning and calorie burn.",
            imageName: "adult_jumping_jacks"
        ),
        ExerciseItem(
            name: "Calf Raises",
            tier: .adult,
            tag: "⚪",
            obstacle: "Low double-bar",
            cameraCheck: "Ankles lift",
            howTo: "Push through the balls of your feet to raise your heels high.",
            prevents: "Achilles tendon tightness.",
            fitnessBenefit: "Strengthens lower calf muscles.",
            imageName: "adult_calf_raises"
        ),
        ExerciseItem(
            name: "Shadow Punches",
            tier: .adult,
            tag: "⚪",
            obstacle: "Floating target",
            cameraCheck: "Wrist snaps forward",
            howTo: "Punch forward rhythmically with control and speed.",
            prevents: "Upper body tension.",
            fitnessBenefit: "Improves shoulder endurance and arm definition.",
            imageName: "adult_shadow_punches"
        ),
        ExerciseItem(
            name: "Single-Leg Stand",
            tier: .adult,
            tag: "⚪",
            obstacle: "Stepping stone",
            cameraCheck: "One ankle raised, held",
            howTo: "Balance on one leg with a stable core.",
            prevents: "Ankle instability.",
            fitnessBenefit: "Refines deep stabilizing muscles.",
            imageName: "adult_single_leg_stand"
        ),

        // MARK: Kid Tier
        ExerciseItem(
            name: "Fast Feet",
            tier: .kid,
            tag: "⚪",
            obstacle: "Running track",
            cameraCheck: "Knees alternating quickly",
            howTo: "Run in place as fast as you can on your toes!",
            prevents: "Sluggishness and low energy.",
            fitnessBenefit: "Boosts speed, agility, and footwork.",
            imageName: "kid_fast_feet"
        ),
        ExerciseItem(
            name: "Jumping Jacks",
            tier: .kid,
            tag: "⚪",
            obstacle: "Garden gate",
            cameraCheck: "Wrists up, ankles apart",
            howTo: "Jump wide like a star, then snap back together.",
            prevents: "Inactivity.",
            fitnessBenefit: "Full body coordination and cardio stamina.",
            imageName: "kid_jumping_jacks"
        ),
        ExerciseItem(
            name: "Skipping",
            tier: .kid,
            tag: "⚪",
            obstacle: "Stepping stones",
            cameraCheck: "Alternating bounces",
            howTo: "Skip forward with a hop-step rhythm.",
            prevents: "Coordination blocks.",
            fitnessBenefit: "Improves rhythm, balance, and leg power.",
            imageName: "kid_skipping"
        ),
        ExerciseItem(
            name: "Jumps",
            tier: .kid,
            tag: "⚪",
            obstacle: "Frog pond",
            cameraCheck: "Hips spike upward",
            howTo: "Leap up into the air like a jumping frog!",
            prevents: "Weak explosive power.",
            fitnessBenefit: "Builds explosive leg strength and springiness.",
            imageName: "kid_jumps"
        ),
        ExerciseItem(
            name: "One-Foot Hops",
            tier: .kid,
            tag: "⚪",
            obstacle: "Lily pad",
            cameraCheck: "One ankle rises and lands",
            howTo: "Hop on one foot across the lily pad.",
            prevents: "Ankle weakness.",
            fitnessBenefit: "Enhances unilateral balance and bone density.",
            imageName: "kid_one_foot_hops"
        ),
        ExerciseItem(
            name: "Squats (\"Duck under the branch\")",
            tier: .kid,
            tag: "⚪",
            obstacle: "Low branch",
            cameraCheck: "Hips drop",
            howTo: "Duck low under the pretend branch by bending your knees.",
            prevents: "Poor posture habits.",
            fitnessBenefit: "Strengthens legs and encourages flexible movement.",
            imageName: "kid_squats"
        ),
        ExerciseItem(
            name: "Lunges (\"Dino steps\")",
            tier: .kid,
            tag: "⚪",
            obstacle: "Wide gap",
            cameraCheck: "One knee bends",
            howTo: "Take a huge dinosaur step forward and lower down.",
            prevents: "Stiff hips.",
            fitnessBenefit: "Improves hip mobility and leg strength.",
            imageName: "kid_lunges"
        ),
        ExerciseItem(
            name: "Flamingo Stand",
            tier: .kid,
            tag: "⚪",
            obstacle: "Stone to freeze on",
            cameraCheck: "One ankle raised, held",
            howTo: "Stand completely still on one leg like a pink flamingo!",
            prevents: "Wobbliness.",
            fitnessBenefit: "Builds laser focus and core balance.",
            imageName: "kid_flaming_stand"
        )
    ]
}

// MARK: - SwiftUI View for Guide
struct GuideView: View {
    @State private var selectedTier: ExerciseTier = .elderly
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                // Background tuned to Garden Path nature theme
                Color(red: 0.93, green: 0.97, blue: 0.93)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 16) {
                    // Tier Selector Picker
                    Picker("Select Tier", selection: $selectedTier) {
                        ForEach(ExerciseTier.allCases) { tier in
                            Text(tier.rawValue).tag(tier)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)

                    // Subtitle for active tier
                    Text(selectedTier.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)

                    // Exercise List
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(ExerciseRepository.exercises.filter { $0.tier == selectedTier }) { exercise in
                                ExerciseCardView(exercise: exercise)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("Exercise Guide")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Close") {
                            dismiss()
                        }
                        .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

// MARK: - Exercise Card Component
struct ExerciseCardView: View {
    let exercise: ExerciseItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                // Posture Image Placeholder (Replace with actual asset in Asset Catalog)
                Image(exercise.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.green.opacity(0.4), lineWidth: 1)
                    )

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(exercise.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(exercise.tag)
                    }
                    
                    Text("Obstacle: \(exercise.obstacle)")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text("Camera Check: \(exercise.cameraCheck)")
                        .font(.caption2)
                        .foregroundColor(.green.opacity(0.9))
                        .bold()
                }
                Spacer()
            }

            Divider()

            VStack(alignment: .leading, spacing: 6) {
                DetailRow(title: "How to do:", content: exercise.howTo)
                DetailRow(title: "Prevents:", content: exercise.prevents)
                DetailRow(title: "Fitness Benefit:", content: exercise.fitnessBenefit)
            }
            .font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct DetailRow: View {
    let title: String
    let content: String

    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Text(title)
                .bold()
                .foregroundColor(.primary)
            Text(content)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - Preview
#Preview {
    GuideView()
}
