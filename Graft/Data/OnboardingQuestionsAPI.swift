//
//  OnboardingQuestionsAPI.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/17/24.
//

import Foundation

class OnboardingQuestionsAPI: NSObject {
    
    func convertDataToObject(data: Data) -> OnboardingQuestionResponse? {
        var decoder = JSONDecoder()
        do {
            let onboardingQuestions: OnboardingQuestionResponse = try decoder.decode(OnboardingQuestionResponse.self, from: data)
            print(onboardingQuestions)
            return onboardingQuestions
        } catch {
            print(error)
        }
        return nil
    }
}
