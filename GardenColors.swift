//
//  GardenColors.swift
//  Garden Path theme: colors, hex helper, and a layered background.
//
//  Day is the full look. Evening and night change ONLY the background:
//  the sky gradient, plus a tint laid over the hills (not the path,
//  obstacles, or character).
//

import SwiftUI

// MARK: - Hex helper

extension Color {
    /// Create a Color from a hex string like "FFF3C4" or "#FFF3C4".
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var value: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&value)
        let r = Double((value >> 16) & 0xFF) / 255
        let g = Double((value >> 8) & 0xFF) / 255
        let b = Double(value & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

// MARK: - Palette (same in every time of day)

enum GardenPalette {
    // Hills and path
    static let farHill = Color(hex: "CDE8D0")
    static let midHill = Color(hex: "A8D5B5")
    static let nearHill = Color(hex: "7FBF93")
    static let path = Color(hex: "8FBF73")
    static let pathEdge = Color(hex: "6FA05A")

    // UI
    static let accent = Color(hex: "FAA659")
    static let text = Color(hex: "403326")
    static let card = Color.white.opacity(0.85) // keeps text readable at night
}

/// Obstacle colors stay consistent across all tiers so players learn them fast.
enum ObstacleColor {
    static let hurdle = Color(hex: "B07A4F")   // brown
    static let gate = Color(hex: "4FB3A9")     // teal
    static let bar = Color(hex: "F08A6B")      // coral
    static let stone = Color(hex: "F4C95D")    // gold
}

// MARK: - Time of day (background only)

enum TimeOfDay: CaseIterable {
    case day, evening, night

    var sky: LinearGradient {
        let colors: [Color]
        switch self {
        case .day:     colors = [Color(hex: "FFF3C4"), Color(hex: "BFE3F2")]
        case .evening: colors = [Color(hex: "F7A541"), Color(hex: "FFD98A")]
        case .night:   colors = [Color(hex: "0B1026"), Color(hex: "1B2545")]
        }
        return LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
    }

    /// Tint laid over the hill layers only, so bright hills don't clash with the sky.
    var hillTint: Color {
        switch self {
        case .day:     return Color.clear
        case .evening: return Color(hex: "F7A541").opacity(0.25)
        case .night:   return Color(hex: "0B1026").opacity(0.55)
        }
    }
}

// MARK: - Hill shapes

struct HillShape: Shape {
    var amplitude: CGFloat
    var wavelength: CGFloat
    var phase: CGFloat

    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: CGPoint(x: 0, y: rect.height))
        for x in stride(from: CGFloat(0), through: rect.width, by: 4) {
            let angle = (x / wavelength) * 2 * .pi + phase
            let y = rect.height * 0.5 - sin(angle) * amplitude
            p.addLine(to: CGPoint(x: x, y: y))
        }
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.closeSubpath()
        return p
    }
}

struct HillLayer: View {
    let color: Color
    let tint: Color
    let amplitude: CGFloat
    let wavelength: CGFloat
    let phase: CGFloat

    var body: some View {
        ZStack {
            HillShape(amplitude: amplitude, wavelength: wavelength, phase: phase)
                .fill(color)
            HillShape(amplitude: amplitude, wavelength: wavelength, phase: phase)
                .fill(tint)
        }
    }
}

// MARK: - Background view

struct GardenBackground: View {
    var time: TimeOfDay = .day

    var body: some View {
        ZStack {
            time.sky
                .ignoresSafeArea()

            GeometryReader { geo in
                ZStack(alignment: .bottom) {
                    // Three hill layers, far to near
                    HillLayer(color: GardenPalette.farHill, tint: time.hillTint,
                              amplitude: 30, wavelength: geo.size.width * 0.9, phase: 0.5)
                        .frame(height: geo.size.height * 0.55)
                    HillLayer(color: GardenPalette.midHill, tint: time.hillTint,
                              amplitude: 24, wavelength: geo.size.width * 0.7, phase: 2.0)
                        .frame(height: geo.size.height * 0.42)
                    HillLayer(color: GardenPalette.nearHill, tint: time.hillTint,
                              amplitude: 18, wavelength: geo.size.width * 0.5, phase: 3.5)
                        .frame(height: geo.size.height * 0.32)

                    // Path (not tinted: stays the same in every time of day)
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(GardenPalette.pathEdge)
                            .frame(height: 6)
                        Rectangle()
                            .fill(GardenPalette.path)
                    }
                    .frame(height: geo.size.height * 0.16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .ignoresSafeArea()
        }
    }
}

// MARK: - Preview (all three looks)

#Preview {
    HStack(spacing: 0) {
        ForEach(TimeOfDay.allCases, id: \.self) { time in
            GardenBackground(time: time)
        }
    }
}
