//
//  OnboardingAnalytics.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 16.02.2021.
//

final class OnboardingAnalytics {
    func log(step: OnboardingView.Step) {
        let name: String
        
        switch step {
        case .slide1:
            name = "Welcome Screen"
        case .gender:
            name = "Gender Screen"
        case .age:
            name = "Age Screen"
        case .goals:
            name = "Goals Screen"
        case .date:
            name = "When Exam Screen"
        case .country:
            name = "What Country Screencountry"
        case .time:
            name = "Test Time Screen"
        case .testsCount:
            name = "Tests Number Screen"
        case .question1:
            name = "Question 1 Screen"
        case .question2:
            name = "Question 2 Screen"
        case .question3:
            name = "Question 3 Screen"
        case .question4:
            name = "Question 4 Screen"
        case .preloader:
            name = "Plan Preparing Screen"
        case .plan:
            name = "Personal Plan Screen"
        }
        
        SDKStorage.shared
            .amplitudeManager
            .logEvent(name: name, parameters: [:])
    }
}
