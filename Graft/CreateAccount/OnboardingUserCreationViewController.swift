//
//  OnboardingUserCreationViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/12/24.
//

import UIKit

class OnboardingUserCreationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questionsTableView: UITableView?
    
    var onboardingUser: UserModel?
    var isBasicGathering: Bool = true
    var hasAdoptedBefore: Bool = false
    
    var delegate: OnboardingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsTableView?.delegate = self
        questionsTableView?.dataSource = self
        questionsTableView?.register(UINib(nibName: "UserCreationTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCreationTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = onboardingUser?.accountType else { return UITableViewCell() }
        if isBasicGathering {
            if let cell: UserCreationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserCreationTableViewCell", for: indexPath) as? UserCreationTableViewCell {
                cell.textField?.placeholder = getPlaceholderForBasicEntry(row: indexPath.row)
                return cell
            }
        }else {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let type = onboardingUser?.accountType else { return 0 }
        if isBasicGathering {
            return 7
        }else {
            switch type {
            case .AdoptiveParent:
                if hasAdoptedBefore {
                    return 6
                }else {
                    return 5
                }
            case .ExpectantParent:
                return 5
            case .ProfessionalAdvisor:
                return 4
            default:
                return 4
            }
        }
    }
    
    
    
    func getPlaceholderForBasicEntry(row: Int) -> String {
        var placeHolders: [String] = [
            "First Name",
            "Last Name",
            "Desired Username",
            "State of Residence",
            "Email",
            "Password",
            "Confirm Password"
        ]
        return placeHolders[row]
    }
    
    func getPlaceHolderForAdvancedEntry(row: Int) -> String {
        var onboardingQuestions = OnboardingQuestions()
        switch onboardingUser?.accountType {
        case .AdoptiveParent:
            return onboardingQuestions.adoptiveParentQuestions[row]
        case .ExpectantParent:
            return onboardingQuestions.expectantParentQuestions[row]
        case .ProfessionalAdvisor:
            return onboardingQuestions.counselorQuestions[row]
        case .LegalCounsel:
            return onboardingQuestions.lawyerQuestions[row]
        case nil:
            return ""
        }
    }
    
    

}
