//
//  OnboardingUserCreationViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/26/24.
//

import UIKit

class OnboardingUserCreationViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    

    var onboardingUser: UserModel?
    var delegate: OnboardingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.tag = 0
        firstNameTextField.addTarget(self, action:#selector(textFieldDidChange(_ : )) , for: .editingChanged)
        lastNameTextField.tag = 1
        lastNameTextField.addTarget(self, action:#selector(textFieldDidChange(_ : )) , for: .editingChanged)
        birthdayTextField.tag = 2
        birthdayTextField.addTarget(self, action:#selector(textFieldDidChange(_ : )) , for: .editingChanged)
        emailTextField.tag = 3
        emailTextField.addTarget(self, action:#selector(textFieldDidChange(_ : )) , for: .editingChanged)
        stateTextField.tag = 4
        stateTextField.addTarget(self, action:#selector(textFieldDidChange(_ : )) , for: .editingChanged)
        nextButton.isEnabled = false
        nextButton.alpha = 0.35
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            onboardingUser?.firstName = textField.text
        case 1:
            onboardingUser?.lastName = textField.text
        case 2:
            onboardingUser?.birthday = textField.text
        case 3:
            onboardingUser?.email = textField.text
        default:
            onboardingUser?.address = textField.text
        }
        delegate?.updateNewUserInformation(user: self.onboardingUser ?? UserModel())
        checkAnswersForButtonFunctionality()
    }
    
    func checkAnswersForButtonFunctionality() {
        let isValidEmail = onboardingUser?.email?.isValidEmail() ?? false
        print(onboardingUser, isValidEmail)
        if let user = onboardingUser {
            if user.firstName != nil && user.lastName != nil && user.birthday != nil && isValidEmail && user.address != nil {
                nextButton.alpha = 1
                nextButton.isEnabled = true
            }else {
                nextButton.isEnabled = false
                nextButton.alpha = 0.35

            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        delegate?.didTapNext()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        delegate?.didTapBack()
    }
    
}
