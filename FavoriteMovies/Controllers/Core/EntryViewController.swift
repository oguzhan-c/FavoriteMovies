//
//  EntryViewController.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 1.11.2022.
//

import UIKit

class EntryViewController: UITabBarController {
    public static let isAuthenticated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews(){
        let vcLogin = UINavigationController(rootViewController: LoginViewController())
        let vcRegister = UINavigationController(rootViewController: RegisterViewController())
        
        vcLogin.title = "Login"
        vcRegister.title = "Register"
        
        vcLogin.tabBarItem.image = UIImage(systemName: "person")
        vcRegister.tabBarItem.image = UIImage(systemName: "person.badge.plus")
        setViewControllers([
            vcLogin ,
            vcRegister ,
        ], animated: true)
        
        tabBar.tintColor = .label
            
    }
}
