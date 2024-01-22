//
//  UserModels.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/11/24.
//

import Foundation


class UserModel: NSObject, Codable {
    var firstName: String?
    var lastName: String?
    var userName: String?
    var email: String?
    var address: String?
    var phoneNumber: String?
    var biography: String?
    var accountType: AccountType?
    var adoptiveParentOptions: AdoptiveParentOptions?
    var expectantParentOptions: ExpectantParentOptions?
    var counselorOptions: CounselorOptions?
    var legalEntityOptions: LegalEntityOptions?
    var postIDs: [String] = []
}

class BusinessObject: NSObject, Codable {
    var businessName: String?
    var address: String?
    var phoneNumber: String?
    var businessDescription: String?
}

struct AdoptiveParentOptions: Codable {
    var hasCompletedHomestudy: Bool = false
    var outOfStateOpen: Bool = false
    var childrenInHome: Int = 0
    var previousAdoptions: Int = 0
}

struct ExpectantParentOptions: Codable {
    var prenatalCare: Bool = false
    var bothParentsInvolved: Bool = false
    var outOfStateOpen: Bool = false
    var opennessLevelDesired: String = ""
}

struct CounselorOptions: Codable {
    var hasLiscense: Bool = false
    var outOfStateOpen: Bool = false
    var specialization: String = ""
    var isReligious: Bool = false
    
}

struct LegalEntityOptions: Codable {
    var firmName: String = ""
    var outOfStateOpen: Bool = false
    var retainerFee: Int = 0
    var yearsPracticing: Int = 0
}


enum AccountType: Int, Codable {
    case AdoptiveParent
    case ExpectantParent
    case ProfessionalAdvisor
    case LegalCounsel
}

class OnboardingQuestion: NSObject, Codable {
    var questionString: String = ""
    var questionType: String = ""
    var isPreviousDependent: Bool = false
    var questionID: String = ""
}

class AdvancedEntryQuestions: NSObject, Codable {
    var adoptiveParentQuestions: [OnboardingQuestion] = []
    var expectantParentQuestions: [OnboardingQuestion] = []
    var counselorQuestions: [OnboardingQuestion] = []
    var legalCounselQuestions: [OnboardingQuestion] = []
}

class OnboardingQuestionResponse: NSObject, Codable {
    var basicEntryQuestions: [OnboardingQuestion]?
    var advancedEntryQuestions: AdvancedEntryQuestions?
}
