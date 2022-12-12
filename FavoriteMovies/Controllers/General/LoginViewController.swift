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
        view.backgroundColor = .systemPink
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        configureConstraints()
        configureBackroundColor()
    }

    private func configureBackroundColor(){
        emailLabel.backgroundColor = view.backgroundColor
        emailTextField.backgroundColor = view.backgroundColor
        passwordLabel.backgroundColor = view.backgroundColor
        passwordTextField.backgroundColor = view.backgroundColor
    }
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.tintColor = .systemBackground
        label.font = UIFont(name: "Times New Roman", size: 25) //Add Times New Roman font family
        return label
    }()
    
    private let emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "exemple@exemple.com"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .bezel
        textField.layer.borderWidth = 5
        textField.layer.cornerRadius = 10
        textField.font = UIFont(name: "Times New Roman", size: 25) //Add Times New Roman font family
        return textField
    }()
    
    private let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 25) //Add Times New Roman font family
        return label
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "*********"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .bezel
        textField.layer.borderWidth = 5
        textField.layer.cornerRadius = 10
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
        button.addTarget(LoginViewController.self, action: #selector(loginPressed(_ :)), for: .touchUpInside)
        return button
    }()
    
    private func configureConstraints(){
        let emailLabelConstraints = [
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 50) ,
            emailLabel.widthAnchor.constraint(equalToConstant: 200) ,
            emailLabel.heightAnchor.constraint(equalToConstant: 50) ,
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor , constant: 18) ,
            emailTextField.widthAnchor.constraint(equalToConstant: 350) ,
            emailTextField.heightAnchor.constraint(equalToConstant: 50) ,
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let passwordLabelConstraints = [
            passwordLabel.topAnchor.constraint(equalTo:emailTextField.bottomAnchor , constant: 50) ,
            passwordLabel.widthAnchor.constraint(equalToConstant: 200) ,
            passwordLabel.heightAnchor.constraint(equalToConstant: 50) ,
            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.topAnchor.constraint(equalTo:passwordLabel.bottomAnchor , constant: 18) ,
            passwordTextField.widthAnchor.constraint(equalToConstant: 200) ,
            passwordTextField.heightAnchor.constraint(equalToConstant: 50) ,
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor , constant: 50) ,
            loginButton.centerXAnchor.constraint(equalTo: passwordLabel.centerXAnchor ) ,
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
            print("login succes")
        }
        
    }
    

