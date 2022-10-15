//
//  HomeViewController.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 11.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    private var headerView: HomePosterUIView?

    private let homeTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollecitonViewTableViewCell.self, forCellReuseIdentifier: CollecitonViewTableViewCell.identifier)
        return table
    }()

    enum Sections : Int{
        case getTrendingMovie = 0
        case getTrendingTv = 1
        case getPopular = 2
        case getUpcomingMovie = 3
        case getTopRated = 4
    }
    
    let sectionTitles : [String] = [
                                    "Trending Movies" ,
                                    "Trending Tv" ,
                                    "Populer" ,
                                    "Upcoming Movies",
                                    "Top Rated"
                                   ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        view.addSubview(homeTable)
        
        homeTable.delegate = self
        homeTable.dataSource = self
        
        headerView = HomePosterUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        homeTable.tableHeaderView = headerView
                
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTable.frame = view.bounds
    }
}

extension HomeViewController : UITableViewDataSource , UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollecitonViewTableViewCell.identifier) as? CollecitonViewTableViewCell else{
                return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 18 , weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffSet = view.safeAreaInsets.top //Off Set for top
        let offSet = scrollView.contentOffset.y + defaultOffSet
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offSet))
    }
}
