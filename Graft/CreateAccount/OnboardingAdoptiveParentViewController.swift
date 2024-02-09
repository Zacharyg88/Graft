//
//  OnboardingAdoptiveParentViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/26/24.
//

import UIKit

class OnboardingAdoptiveParentViewController: UIViewController {
    
    @IBOutlet weak var homeStudySelection: UISegmentedControl!
    @IBOutlet weak var outOfStateSelection: UISegmentedControl!
    @IBOutlet weak var childrenSelection: UIButton!
    @IBOutlet weak var adoptionSelection: UIButton!
    @IBOutlet weak var childrenSelectionMenu: UIMenu!
    @IBOutlet weak var adoptionSelectionMenu: UIMenu!
    
    var onboardingUser: UserModel?
    var delegate: OnboardingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childrenSelection.layer.cornerRadius = childrenSelection.frame.height / 2
        adoptionSelection.layer.cornerRadius = adoptionSelection.frame.height / 2
        
        childrenSelection.menu = UIMenu(children: [
            UIAction(title: "0", handler: { _ in
                self.didSelectChildren(selection: 0)
            }),
            UIAction(title: "1", handler: { _ in
                self.didSelectChildren(selection: 1)
            }),
            UIAction(title: "2", handler: { _ in
                self.didSelectChildren(selection: 3)
            }),
            UIAction(title: "3", handler: { _ in
                self.didSelectChildren(selection: 3)
            }),
            UIAction(title: "4+", handler: { _ in
                self.didSelectChildren(selection: nil)
            })
            
        ])
        
        adoptionSelection.menu = UIMenu(children: [
            UIAction(title: "0", handler: { _ in
                self.didSelectAdoptions(selection: 0)
            }),
            UIAction(title: "1", handler: { _ in
                self.didSelectAdoptions(selection: 1)
            }),
            UIAction(title: "2", handler: { _ in
                self.didSelectAdoptions(selection: 2)
            }),
            UIAction(title: "3", handler: { _ in
                self.didSelectAdoptions(selection: 3)
            }),
            UIAction(title: "4+", handler: { _ in
                self.didSelectAdoptions(selection: nil)
            }),
        ])
        
    }
    @IBAction func homeStudySegmentSelected(_ sender: Any) {
        if homeStudySelection.selectedSegmentIndex == 0 {
            onboardingUser?.adoptiveParentOptions?.hasCompletedHomestudy = true
        }else {
            onboardingUser?.adoptiveParentOptions?.hasCompletedHomestudy = false
        }
        delegate?.updateNewUserInformation(user: onboardingUser ?? UserModel())
    }
    
    @IBAction func outOfStateMatchSegmentSelected(_ sender: Any) {
        if outOfStateSelection.selectedSegmentIndex == 0 {
            onboardingUser?.adoptiveParentOptions?.outOfStateOpen = true
        }else {
            onboardingUser?.adoptiveParentOptions?.outOfStateOpen = false
        }
        delegate?.updateNewUserInformation(user: onboardingUser ?? UserModel())
    }
    
    func didSelectChildren(selection: Int?) {
        self.onboardingUser?.adoptiveParentOptions?.childrenInHome = selection
        self.delegate?.updateNewUserInformation(user: onboardingUser ?? UserModel())
    }
    
    func  didSelectAdoptions(selection: Int?) {
        self.onboardingUser?.adoptiveParentOptions?.previousAdoptions = selection
        self.delegate?.updateNewUserInformation(user: onboardingUser ?? UserModel())
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        delegate?.didTapNext()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        delegate?.didTapBack()
    }
    
    
}
