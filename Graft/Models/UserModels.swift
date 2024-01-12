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


enum AccountType: Codable {
    case AdoptiveParent
    case ExpectantParent
    case ProfessionalAdvisor
    case LegalCounsel
}

struct OnboardingQuestions {
    var adoptiveParentQuestions: [String] = [
        "Have you competed your homestudy?",
        "Are you open to out-of-state matches?",
        "How many other children do you have?",
        "Have you adopted before?",
        "If so, how many times?"
    ]
    var expectantParentQuestions: [String] = [
        "Are you seeking pre-natal care?",
        "Are both expectant parents involved in the adoption plan?",
        "Are you open to out-of-state matches?",
        "What level of openness are you looking for?"
    ]
    var counselorQuestions: [String] = [
        "Are you a fully liscensed mental health practicioner?",
        "Are you open to out-of-state clients?",
        "Do you have any areas of specialization?",
        "Are you a religious/spiritual counselor/therapist?"
    ]
    var lawyerQuestions: [String] = [
        "What is the name of the firm you represent?",
        "Are you open to out-of-state clients?",
        "What is your retainer fee?",
        "How many years have you been practicing?"
    ]
}
