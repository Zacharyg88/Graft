//
//  OnboardingUserPasswordViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/26/24.
//

import UIKit

class OnboardingUserPasswordViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var randomlyGenerateButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var onboardingUser: UserModel?
    var delegate: OnboardingDelegate?
    var nextButtonIsLocked: Bool = true {
        didSet {
            if !nextButtonIsLocked {
                nextButton.isEnabled = true
                nextButton.alpha = 1
            }else {
                nextButton.isEnabled = false
                nextButton.alpha = 0.35
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonIsLocked = true
        usernameTextField.tag = 0
        usernameTextField.addTarget(self, action: #selector(textFieldDidUpdate(_ : )), for: .editingDidEnd)
        passwordTextField.tag = 1
        passwordTextField.addTarget(self, action: #selector(textFieldDidUpdate(_ : )), for: .editingDidEnd)
        confirmTextField.tag = 2
        confirmTextField.addTarget(self, action: #selector(textFieldDidUpdate(_ : )), for: .editingDidEnd)
        

    }
    
    @objc func textFieldDidUpdate(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            //Async check on valid username required here
            onboardingUser?.userName = textField.text
        case 2:
            if passwordsMatch() {
             print("Passwords Match!")
                nextButtonIsLocked = false
            }
        default:
            print(textField.text)
        }
    }
    
    
    func passwordsMatch() -> Bool {
        guard let passwordText = passwordTextField.text else { return false }
        guard let confirmText = confirmTextField.text else { return false }
        
        return (passwordText.isValidPassword() && confirmText.isValidPassword() && (passwordText == confirmText))
    }
    
    
    @IBAction func generateRandomUsername() {
        guard let firstName = onboardingUser?.firstName else { return }
        guard let lastInitial = onboardingUser?.lastName?.first else { return }
        let randomInt = Int.random(in: 0...2024)
        //Will need check here to verify username hasn't been taken yet
        self.usernameTextField.text = firstName + "\(lastInitial)" + "\(randomInt)"
    }
    
    @IBAction func nextButtonTapped() {
        delegate?.didTapNext()
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        delegate?.didTapBack()
    }
    
}
