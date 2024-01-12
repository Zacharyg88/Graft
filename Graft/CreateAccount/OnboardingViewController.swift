//
//  OnboardingViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/10/24.
//

import UIKit

protocol OnboardingDelegate {
    func didTapNext()
    func didTapBack()
    func updateNewUserInformation(user: UserModel)
}

class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, OnboardingDelegate {
    
    var currentOnboardingStep: OnboardingStep = .AccountType
    var allSteps: [OnboardingStep] = [.AccountType, .UserCreation, .EmailPassword, .PhoneInput, .PhoneVerification]
    var newUser: UserModel?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newUser = UserModel()
        // Do any additional setup after loading the view.
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentOnboardingStep.hashValue
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    func didTapBack() {
        
    }
    
    func didTapNext() {
        
    }
    
    func updateNewUserInformation(user: UserModel) {
        self.newUser = user
    }

}

enum OnboardingStep {
    
    case AccountType
    case UserCreation
    case EmailPassword
    case PhoneInput
    case PhoneVerification
}
