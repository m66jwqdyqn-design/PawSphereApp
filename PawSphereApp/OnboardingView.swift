//
//  OnboardingView.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 02/11/2026.
//



import SwiftUI

// MARK: - CONTENT

// 🟤 1 - ONBOARDING SLIDE START
struct OnboardingSlide: Identifiable, Hashable {
    let id: Int
    let image: String
    let title: String
    let text: String
}
// 🟤 1 - ONBOARDING SLIDE END


// MARK: - PAWSPHERE DATA

// 🟤 2 - PAWSPHERE START
enum PawSphere {

    static let slides: [OnboardingSlide] = [

    ]

}
// 🟤 2 - PAWSPHERE END


// MARK: - ONBOARDING VIEW

// 🟤 3 - ONBOARDING VIEW START
struct OnboardingView: View {

    @State private var index = 0

    // 🟤 4 - BODY START
    var body: some View {

        // 🟣 5 - ZSTACK START
        ZStack {

            // 🔵 6 - VSTACK START
            VStack(spacing: 0) {

                // 🟡 7 - TABVIEW START
                TabView(selection: $index) {

                    // 🟡 8 - FOREACH START
                    ForEach(PawSphere.slides) { slide in

                        SlidePage(slide: slide)
                            .tag(slide.id)

                    }
                    // 🟡 8 - FOREACH END

                }
                // 🟡 7 - TABVIEW END
                .tabViewStyle(.page(indexDisplayMode: .never))

            }
            // 🔵 6 - VSTACK END

        }
        // 🟣 5 - ZSTACK END

    }
    // 🟤 4 - BODY END

}
// 🟤 3 - ONBOARDING VIEW END


// MARK: - SLIDE PAGE

// 🟤 9 - SLIDE PAGE START
struct SlidePage: View {

    let slide: OnboardingSlide

    // 🟤 10 - BODY START
    var body: some View {

        // 🔵 11 - VSTACK START
        VStack {

            Image(slide.image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)

            Text(slide.title)

            Text(slide.text)

        }
        // 🔵 11 - VSTACK END

    }
    // 🟤 10 - BODY END

}
// 🟤 9 - SLIDE PAGE END


// MARK: - PREVIEW

// 🟣 12 - PREVIEW START
#Preview {

    OnboardingView()

}
// 🟣 12 - PREVIEW END

