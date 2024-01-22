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

class OnboardingViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, OnboardingDelegate {
    
    var currentOnboardingStep: OnboardingStep = .AccountType {
        didSet {
            print(currentOnboardingStep)
        }
    }
    var allSteps: [OnboardingStep] = [.AccountType, .UserCreation, .EmailPassword, .PhoneInput, .PhoneVerification]
    var newUser: UserModel?
    var pageViewController: UIPageViewController?
    var viewControllers: [UIViewController] = [OnboardingAccountTypeViewController(), OnboardingUserCreationViewController()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newUser = UserModel()
        var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        pageVC.setViewControllers([viewControllers.first ?? UIViewController()], direction: .forward, animated: true, completion: nil)
        pageVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        self.pageViewController = pageVC
        
        addChild(self.pageViewController ?? UIViewController())
        view.addSubview(self.pageViewController?.view ?? UIView())
        self.pageViewController?.didMove(toParent: self)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if currentOnboardingStep == .AccountType {
            return nil
        }else {
            return getViewControllerForOnboardingStep(step: currentOnboardingStep.rawValue - 1)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if currentOnboardingStep == .PhoneVerification {
            return nil
        }else {
            return getViewControllerForOnboardingStep(step: currentOnboardingStep.rawValue + 1)
        }
    }
    
    func didTapBack() {
        currentOnboardingStep = allSteps[currentOnboardingStep.rawValue - 1]
        
    }
    
    func didTapNext() {
        currentOnboardingStep = allSteps[currentOnboardingStep.rawValue + 1]
    }
    
    func updateNewUserInformation(user: UserModel) {
        self.newUser = user
    }
    
    func getViewControllerForOnboardingStep(step: Int) -> UIViewController? {
        return viewControllers[step]
    }

}

enum OnboardingStep: Int {
    
    case AccountType
    case UserCreation
    case EmailPassword
    case PhoneInput
    case PhoneVerification
}
