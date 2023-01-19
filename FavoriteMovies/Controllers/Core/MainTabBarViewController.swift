//
//  MainTabBarViewController.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 11.10.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        configureViews()
    }
      
    
    private func configureViews(){
        let vcHome = UINavigationController(rootViewController: HomeViewController())
        let vcUpcoming = UINavigationController(rootViewController: UpcomingViewController())
        let vcSearch = UINavigationController(rootViewController: SearchViewController())
        vcHome.tabBarItem.image = UIImage(systemName: "house.circle")
        vcUpcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        vcSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        setViewControllers([
            vcHome ,
            vcUpcoming ,
            vcSearch ,
        ], animated: true)
        
        vcHome.title = "Home"
        vcSearch.title = "Search"
        vcUpcoming.title = "Coming Soon"
        
        tabBar.tintColor = .label
    }
    

    
}
