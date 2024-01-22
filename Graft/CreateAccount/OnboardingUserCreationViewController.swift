//
//  OnboardingUserCreationViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/12/24.
//

import UIKit
var backend = DummyBackend()

class OnboardingUserCreationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, QuestionCellDelegate {

    @IBOutlet weak var questionsTableView: UITableView?
    
    var onboardingUser: UserModel?
    var isBasicGathering: Bool = true
    var hasAdoptedBefore: Bool = false
    
    var delegate: OnboardingDelegate?
    var onboardingQuestions: OnboardingQuestionResponse? {
        didSet {
            questionsTableView?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsTableView?.delegate = self
        questionsTableView?.dataSource = self
        questionsTableView?.register(UINib(nibName: "UserCreationTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCreationTableViewCell")
        questionsTableView?.register(UINib(nibName: "UserCreationSwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCreationSwitchTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var question: OnboardingQuestion?
        if isBasicGathering {
            question = onboardingQuestions?.basicEntryQuestions?[indexPath.row]
        }else {
            switch onboardingUser?.accountType {
            case .AdoptiveParent:
                question = onboardingQuestions?.advancedEntryQuestions?.adoptiveParentQuestions[indexPath.row]
            case .ExpectantParent:
                question = onboardingQuestions?.advancedEntryQuestions?.expectantParentQuestions[indexPath.row]
            case .ProfessionalAdvisor:
                question = onboardingQuestions?.advancedEntryQuestions?.counselorQuestions[indexPath.row]
            default:
                question = onboardingQuestions?.advancedEntryQuestions?.legalCounselQuestions[indexPath.row]
            }
        }
        
        let cell = getCellForQuestionType(onboardingQuestion: question ?? OnboardingQuestion(), indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isBasicGathering {
            return onboardingQuestions?.basicEntryQuestions?.count ?? 0
        }else {
            switch onboardingUser?.accountType {
            case .AdoptiveParent:
                return onboardingQuestions?.advancedEntryQuestions?.adoptiveParentQuestions.count ?? 0
            case .ExpectantParent:
                return onboardingQuestions?.advancedEntryQuestions?.expectantParentQuestions.count ?? 0
            case .ProfessionalAdvisor:
                return onboardingQuestions?.advancedEntryQuestions?.counselorQuestions.count ?? 0
            case .LegalCounsel:
                return onboardingQuestions?.advancedEntryQuestions?.legalCounselQuestions.count ?? 0
            default:
                return 0
            }
        }
    }
    
    
    func getCellForQuestionType(onboardingQuestion: OnboardingQuestion, indexPath: IndexPath) -> UITableViewCell {
        switch onboardingQuestion.questionType {
        case "Text":
            if let cell: UserCreationTableViewCell = self.questionsTableView?.dequeueReusableCell(withIdentifier: "UserCreationTableViewCell", for: indexPath) as? UserCreationTableViewCell {
                cell.delegate = self
                
                return cell
            }
        case "Selection":
            if let cell: UserCreationTableViewCell = self.questionsTableView?.dequeueReusableCell(withIdentifier: "UserCreationTableViewCell", for: indexPath) as? UserCreationTableViewCell {
                return cell
            }
        case "Bool":
            if let cell: UserCreationSwitchTableViewCell = self.questionsTableView?.dequeueReusableCell(withIdentifier: "UserCreationSwitchTableViewCell", for: indexPath) as? UserCreationSwitchTableViewCell {
                return cell
            }
        case "Int":
            if let cell: UserCreationTableViewCell = self.questionsTableView?.dequeueReusableCell(withIdentifier: "UserCreationTableViewCell", for: indexPath) as? UserCreationTableViewCell {
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func didUpdateAnswer(id: String, boolAnswer: Bool?, stringAnswer: String?, intAnswer: Int?) {
        print(id, boolAnswer, stringAnswer, intAnswer)
    }
    
    

}

protocol QuestionCellDelegate {
    func didUpdateAnswer(id: String, boolAnswer: Bool?, stringAnswer: String?, intAnswer: Int?)
}
