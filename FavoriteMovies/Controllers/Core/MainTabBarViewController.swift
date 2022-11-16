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
        
//        configureEntryViews()
        configureEntry()
    }
    
    private func configureEntryViews(){
        if EntryViewController.isAuthenticated == false{
            configureEntry()
        }
        else{
            configureViews()
        }
    }
    
    
    private func configureViews(){
        let vcHome = UINavigationController(rootViewController: HomeViewController())
        let vcUpcoming = UINavigationController(rootViewController: UpcomingViewController())
        let vcSearch = UINavigationController(rootViewController: SearchViewController())
        let vcWatchList = UINavigationController(rootViewController: WatchListViewController())
        vcHome.tabBarItem.image = UIImage(systemName: "house.circle")
        vcUpcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        vcSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        vcWatchList.tabBarItem.image = UIImage(systemName: "hand.thumbsup.circle.fill")
        setViewControllers([
            vcHome ,
            vcUpcoming ,
            vcSearch ,
            vcWatchList
        ], animated: true)
        
        vcHome.title = "Home"
        vcSearch.title = "Search"
        vcUpcoming.title = "Coming Soon"
        vcWatchList.title = "Favorite"
        
        tabBar.tintColor = .label
    }
    
    private func configureEntry(){
        let vcEntry = UINavigationController(rootViewController: EntryViewController())
        
        setViewControllers([vcEntry] , animated: true)
    }
}
