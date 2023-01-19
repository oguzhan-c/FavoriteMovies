//
//  HomeViewController.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 11.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
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
        
        let headerView = HomePosterUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTable.frame = view.bounds
    }
}

//MARK: -UITableViewDataSource/UITableViewDelegate
extension HomeViewController : UITableViewDataSource , UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier) as? CollectionViewTableViewCell else{
                return UITableViewCell()
        }
        
        switch indexPath.section{
        case Sections.getTrendingMovie.rawValue :
            APIHelper.shared.getTrendingMovies { results in
                switch results{
                case .success(let movies) :
                    cell.configure(with: movies)
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        case Sections.getTrendingTv.rawValue :
            APIHelper.shared.getTrendingTv { results in
                switch results {
                case .success(let trendingTvs) :
                    cell.configure(with: trendingTvs)
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        case Sections.getPopular.rawValue :
            APIHelper.shared.getPopular { results in
                switch results {
                case .success(let populer) :
                    cell.configure(with: populer)
                case .failure(let error) :
                    print(error.localizedDescription)
                }
                
            }
        case Sections.getUpcomingMovie.rawValue :
            APIHelper.shared.getUpcomingMovies { results in
                switch results{
                case .success(let upcoming) :
                    cell.configure(with: upcoming)
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        case Sections.getTopRated.rawValue :
            APIHelper.shared.getTopRateds { results in
                switch results {
                case .success(let topRateds) :
                    cell.configure(with: topRateds)
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
        default: break
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
}
