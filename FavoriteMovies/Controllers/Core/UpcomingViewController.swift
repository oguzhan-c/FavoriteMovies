//
//  UpcomingViewController.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 11.10.2022.
//

import UIKit

class UpcomingViewController: UIViewController {

    private var titles : [Title] = [Title]()
    private let upcomingTable : UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        view.backgroundColor = .systemPink
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        
        fetchUpcoming()
    }
    
//    Table frame covered the all area
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    private func fetchUpcoming(){
        APIHelper.shared.getUpcomingMovies { result in
            switch result {
            case .success(let titles) :
                self.titles = titles
                DispatchQueue.main.async {
                    self.upcomingTable.reloadData()
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}


extension UpcomingViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as? TitleTableViewCell
        else{
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: title.original_name ?? title.original_title ?? "Unknown Title Name", posterURL: title.poster_path ?? "Unknown Poster Path"))
    
        return cell
        
    }
    
//  Configured spaces between cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = titles[indexPath.row]
        
        guard let titleName = title.original_title ?? title.original_name else{return}
        
        APIHelper.shared.getYoutubeVideo(with: titleName) { result in
            switch result{
            case .success(let video) :
                DispatchQueue.main.async {
                    let youtubeVideoController = TitlePreviewViewController()
                    youtubeVideoController.configure(with: TitlePreviewViewModel(title: titleName, youtubeVideo: video, titleOverView: title.overview ?? "No View"))
                    
                    self.navigationController?.pushViewController(youtubeVideoController, animated: true)
                }
                
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
