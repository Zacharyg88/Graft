//
//  ViewController.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var iconViewYConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTextField.alpha = 0
        passwordTextField.alpha = 0
        createAccountButton.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.showLoginOptions()
        })
    }
    
    
    
    func hideLoginOptions() {
        UIView.animate(withDuration: 1) {
            self.iconViewYConstraint.constant += 200
        } completion: { done in
            UIView.animate(withDuration: 0.5) {
                self.emailTextField.alpha = 0
                self.passwordTextField.alpha = 0
                self.createAccountButton.alpha = 0
            }
        }
    }
    
    func showLoginOptions() {
        UIView.animate(withDuration: 1) {
            self.iconViewYConstraint.constant -= 200
        } completion: { done in
            UIView.animate(withDuration: 0.5) {
                self.emailTextField.alpha = 1
                self.passwordTextField.alpha = 1
                self.createAccountButton.alpha = 1
            }
        }
    }
    
    @IBAction func loginWithCredentials(_ sender: Any) {
        if emailTextField.text?.isValidEmail() ?? false && passwordTextField.text?.isValidPassword() ?? false {
            let loginApi = LoginAPI()
            guard let email  = emailTextField.text else { return }
            guard let password = passwordTextField.text else { return }
            let user = loginApi.loginWithCredentials(email: email, password: password)
        }
    }

    @IBAction func createAccountTapped(_ sender: Any) {
        var onboardingVC = OnboardingViewController()
        onboardingVC.modalPresentationStyle = .overFullScreen
        self.present(OnboardingViewController(), animated: true)
    }
    
}

