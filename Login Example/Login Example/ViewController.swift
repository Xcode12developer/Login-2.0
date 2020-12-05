//
//  ViewController.swift
//  Login Example
//
//  Created by The Developer

import UIKit

class ViewController: UIViewController {
    
    let usernames = ["Hello, World", "Goodbye, World", "See ya, World"]
    let passwords = ["world1", "world2", "world3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        usernameField.frame = CGRect(x: 100, y: 300, width: 200, height: 30)
        passwordField.frame = CGRect(x: 100, y: 350, width: 200, height: 30)
        loginButton.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        usernameField.delegate = self
        passwordField.delegate = self
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
    }

    private let usernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Username Here"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
        
    }()

    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password Here"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = true
        return field
        
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(Login), for: .touchUpInside)
        return button
        
        
    }()
    
    @objc func Login() {
        
        let usernameIndex = usernames.firstIndex(of: usernameField.text ?? "No Username Found")
        let passwordIndex = passwords.firstIndex(of: passwordField.text ?? "No Password Found")
        

        
        passwordField.resignFirstResponder()
        
        if (usernameField.text!.count) < 6 || (passwordField.text!.count) < 6 {
            
            let alert = UIAlertController(title: "Whoops",
                                          message: "Please enter all information to log in.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Dismiss",
                                          style: .cancel, handler: nil))
            present(alert, animated: true)
            
        }
        
        else if usernameIndex != usernames.startIndex && passwordIndex != passwords.startIndex {
            let alert = UIAlertController(title: "Incorrect",
                                          message: "Incorrect Username or Password! Please Try Again.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Dismiss",
                                          style: .cancel, handler: nil))
            present(alert, animated: true)
        }

        else if usernameField.text == usernames[usernameIndex!] && passwordField.text == passwords[passwordIndex!] {
            let AfterVC = AfterViewController()
            AfterVC.modalPresentationStyle = .fullScreen
            present(AfterVC, animated: true, completion: nil)
        }
        
        else {
            let alert = UIAlertController(title: "Incorrect!",
                                          message: "Incorrect Username or Password! Please Try Again.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Dismiss",
                                          style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }

}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == usernameField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            Login()
        }

        return true
    }
}
