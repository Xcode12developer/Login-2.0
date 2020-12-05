//
//  AfterViewController.swift
//  Login Example
//
//  Created by Mohamad Mortada on 11/4/20.
//

import UIKit

class AfterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        loginButton.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }
    
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
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

}

