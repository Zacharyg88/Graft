//
//  OnboardingViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/10/24.
//

import UIKit
import FirebaseAuth

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
    var viewControllers: [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newUser = UserModel()
        
        var frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height)
        
        var accountTypeViewController: OnboardingAccountTypeViewController = OnboardingAccountTypeViewController()
        accountTypeViewController.onboardingUser = newUser
        accountTypeViewController.delegate = self
        accountTypeViewController.view.frame = frame
        
        var newUserViewController: OnboardingUserCreationViewController = OnboardingUserCreationViewController()
        newUserViewController.onboardingUser = newUser
        newUserViewController.delegate = self
        newUserViewController.view.frame = frame
        
        var newUserUsernameController: OnboardingUserPasswordViewController = OnboardingUserPasswordViewController()
        newUserUsernameController.onboardingUser = newUser
        newUserUsernameController.delegate = self
        newUserUsernameController.view.frame = frame
        
        viewControllers.append(accountTypeViewController)
        viewControllers.append(newUserViewController)
        //Placeholder for advanced information gathering stage
        viewControllers.append(UIViewController())
        viewControllers.append(newUserUsernameController)
        
        var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        pageVC.setViewControllers([viewControllers.first ?? UIViewController()], direction: .forward, animated: true, completion: nil)
        pageVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height + 64)
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
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func didTapBack() {
        let currentIndex = self.currentOnboardingStep.rawValue
        currentOnboardingStep = allSteps[currentIndex - 1]
        pageViewController?.setViewControllers([getViewControllerForIndex(index: currentIndex)], direction: .reverse, animated: true)
        
    }
    
    func didTapNext() {
        let currentIndex = self.currentOnboardingStep.rawValue
        currentOnboardingStep = allSteps[currentIndex + 1]
        pageViewController?.setViewControllers([getViewControllerForIndex(index: currentOnboardingStep.rawValue)], direction: .forward, animated: true)

    }
    
    func getViewControllerForIndex(index: Int) -> UIViewController {
        switch index {
        case 2:
            switch newUser?.accountType {
            case .AdoptiveParent:
                var adoptiveParentController: OnboardingAdoptiveParentViewController = OnboardingAdoptiveParentViewController()
                adoptiveParentController.onboardingUser = newUser
                adoptiveParentController.delegate = self
                adoptiveParentController.view.frame = self.view.frame
                return adoptiveParentController
            default:
                return UIViewController()
            }
        default:
            return viewControllers[index]
        }
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
