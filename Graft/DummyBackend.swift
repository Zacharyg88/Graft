//
//  DummyBackend.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/17/24.
//

import Foundation

class DummyBackend: NSObject {
    
    var onboardingQuestions: [String: Any] = [
        "basicEntryQuestions": [
            ["questionString": "First Name",
             "questionType": "Text",
             "questionID": UUID().uuidString],
            ["questionString": "Last Name",
             "questionType": "Text",
             "questionID": UUID().uuidString],
            ["questionString": "Email",
             "questionType": "Text",
             "questionID": UUID().uuidString],
            ["questionString": "State of Residence",
             "questionType" : "Selection",
             "questionID": UUID().uuidString]
        ],
        "advancedEntryQuestions": [
            "adoptiveParentQuestions": [
                ["questionString": "Have you completed your Homestudy?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "Are you open to an out-of-state match?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "Do you have any children already?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "Have you adopted before?",
                 "questionType" : "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "If so, how many times?",
                 "questionType": "Int",
                 "isPreviousDependent": "true",
                 "questionID": UUID().uuidString]
            ],
            "expectantParentQuestions" : [
                ["questionString": "Are you seeking pre-natal care?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "Are you open to an out-of-state match?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "Are both expectant parents involved in the adoption plan?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "What level of openness are you looking for?",
                 "questionType" : "Selection",
                 "questionID": UUID().uuidString]
            ],
            "counselorQuestions" : [
                ["questionString": "Are you a fully liscensed mental health practicioner?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "Are you open to out-of-state clients?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "Do you have any areas of specialization?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "If so, what are they?",
                 "questionType" : "Text",
                 "isPreviousDependent": "true",
                 "questionID": UUID().uuidString],
                ["questionString": "Are you a religious/spiritual counselor/therepist?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString]
            ],
            "legalCounselQuestions": [
                ["questionString": "What is the name of the firm you represent?",
                 "questionType": "Text",
                 "questionID": UUID().uuidString],
                ["questionString": "Are you open to out-of-state clients?",
                 "questionType": "Bool",
                 "questionID": UUID().uuidString],
                ["questionString": "What is your retainer fee?",
                 "questionType": "Int",
                 "questionID": UUID().uuidString],
                ["questionString": "How many years have you been practicing?",
                 "questionType" : "Int",
                 "questionID": UUID().uuidString]
            ]
        ]
    ]
}
