//
//  File.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 27.10.2022.
//

import UIKit


protocol SearchResultsViewControllerDelegate : AnyObject{
    func searchResultsViewControllerDidTapItem(_ viewModel : TitlePreviewViewModel)
}


class SearchResultsViewController: UIViewController {
    
    
    public weak var delegate : SearchResultsViewControllerDelegate?

   
    public var titles: [Title] = [Title]()
        
    public let searchResultsCollectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
   
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
    

    

}


extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let title = titles[indexPath.row]
        guard let titleName = title.original_title else {return}
        
        APIHelper.shared.getYoutubeVideo(with: titleName) { result in
            switch result {
            case .success(let video) :
                self.delegate?.searchResultsViewControllerDidTapItem(TitlePreviewViewModel(title: title.original_title ?? "unknown", youtubeVideo: video, titleOverView: title.overview ?? "unknown"))
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
