//
//  OnboardingAccountTypeViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/11/24.
//

import UIKit

class OnboardingAccountTypeViewController: UIViewController {
    
    @IBOutlet weak var adoptiveParentView: UIView?
    @IBOutlet weak var expectantParentView: UIView?
    @IBOutlet weak var counselorView: UIView?
    @IBOutlet weak var laywerView: UIView?
    @IBOutlet weak var confirmButton: UIButton?

    var delegate: OnboardingDelegate?
    var onboardingUser: UserModel?
    var currentAccountType: AccountType? {
        didSet {
            adjustUIForSelection()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var adoptiveTouch: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.adoptiveParentSelected))
        adoptiveParentView?.addGestureRecognizer(adoptiveTouch)
        adoptiveParentView?.tag = 0
        adoptiveParentView?.layer.cornerRadius = 12
        
        var expectantTouch: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.expectantParentSelected))
        expectantParentView?.addGestureRecognizer(expectantTouch)
        expectantParentView?.tag = 1
        expectantParentView?.layer.cornerRadius = 12
        
        var counselorTouch: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.counselorSelected))
        counselorView?.addGestureRecognizer(counselorTouch)
        counselorView?.tag = 2
        counselorView?.layer.cornerRadius = 12
        
        var laywerTouch: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.laywerSelected))
        laywerView?.addGestureRecognizer(laywerTouch)
        laywerView?.tag = 3
        laywerView?.layer.cornerRadius = 12
        
        confirmButton?.layer.cornerRadius = 12
    }
    
    @objc func adoptiveParentSelected() {
        currentAccountType = .AdoptiveParent
    }
    
    @objc func expectantParentSelected() {
        currentAccountType = .ExpectantParent
    }
    
    @objc func counselorSelected() {
        currentAccountType = .ProfessionalAdvisor
    }
    
    @objc func laywerSelected() {
        currentAccountType = .LegalCounsel
    }
    
    func adjustUIForSelection() {
        var viewsArray: [UIView] = [adoptiveParentView ?? UIView(), expectantParentView ?? UIView(), counselorView ?? UIView(), laywerView ?? UIView()]
        for view in viewsArray {
            if view.tag == currentAccountType?.hashValue {
                view.layer.borderWidth = 2
                view.layer.borderColor = UIColor(named: "Golden Glow")?.cgColor
            }else {
                view.layer.borderColor = UIColor(.clear).cgColor
                view.layer.borderWidth = 0
            }
        }
    }
    
    
    @IBAction func confirmTapped(_ sender: Any) {
        onboardingUser?.accountType = self.currentAccountType
        delegate?.updateNewUserInformation(user: self.onboardingUser ?? UserModel())
        delegate?.didTapNext()
    }
    
}
