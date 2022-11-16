//
//  LoginViewController.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 16.11.2022.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        configureConstraints()
    }
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemPurple
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 25) //Add Times New Roman font family
        return label
    }()
    
    private let emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "exemple@exemple.com"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemPurple
        textField.font = UIFont(name: "Times New Roman", size: 25) //Add Times New Roman font family
        return textField
    }()
    
    private let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemPurple
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 25) //Add Times New Roman font family
        return label
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "*********"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemPurple
        textField.font = UIFont(name: "Times New Roman", size: 25) //Add Times New Roman font family
        return textField
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.textAlignment = .center
//      Here we tell button go loginPressed func and work when button pressed.
        button.addTarget(self, action: #selector(loginPressed(_ :)), for: .touchUpInside)
        return button
    }()
    
    private func configureConstraints(){
        let emailLabelConstraints = [
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 50) ,
            emailLabel.widthAnchor.constraint(equalToConstant: 400) ,
            emailLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor , constant: 18) ,
            emailTextField.widthAnchor.constraint(equalToConstant: 400) ,
            emailTextField.heightAnchor.constraint(equalToConstant: 50) ,
        ]
        
        let passwordLabelConstraints = [
            passwordLabel.topAnchor.constraint(equalTo:emailTextField.bottomAnchor , constant: 50) ,
            passwordLabel.widthAnchor.constraint(equalToConstant: 400) ,
            passwordLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.topAnchor.constraint(equalTo:passwordLabel.bottomAnchor , constant: 18) ,
            passwordTextField.widthAnchor.constraint(equalToConstant: 400) ,
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor , constant: 50) ,
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor ) ,
            loginButton.widthAnchor.constraint(equalToConstant: 100)
        ]

        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordLabelConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
    }

//    This func working when button pressed
//    this func is progres now
    @objc func loginPressed(_ sender: UIButton) {
                   print("Pressed")
    
        print(emailTextField.text!)
        print(passwordTextField.text!)
    }
    
}