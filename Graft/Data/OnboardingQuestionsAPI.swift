//
//  OnboardingQuestionsAPI.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/17/24.
//

import Foundation

class OnboardingQuestionsAPI: NSObject {
    
//    func getOnboardingQuestions() -> OnboardingQuestionResponse? {
//        let encoder = JSONEncoder()
//        do {
//            let data = try JSONSerialization.data(withJSONObject: DummyBackend().onboardingQuestions, options: .prettyPrinted)
//            return convertDataToObject(data: data)
//                
//        }catch {
//            print(error)
//        }
//        
//        return nil
//    }
    
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
