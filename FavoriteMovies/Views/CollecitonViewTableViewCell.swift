//
//  CollecitonTableViewCell.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 15.10.2022.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel)
}


// it's handling all section.This is the base section handler
class CollectionViewTableViewCell: UITableViewCell {

    weak var delegate: CollectionViewTableViewCellDelegate?

    static let identifier = "CollectionViewTableViewCell"
    
    private var titles : [Title] = [Title]()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 144, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemCyan
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with titles : [Title]){
        self.titles = titles
        DispatchQueue.main.async {[weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension CollectionViewTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell
        else {return
            UICollectionViewCell()}
        
        guard let model = titles[indexPath.row].poster_path
        else{
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = titles[indexPath.row]
        guard let titleName = item.original_title else{return}
        APIHelper.shared.getYoutubeVideo(with: titleName) { result in
            switch result {
            case .success(let video) :
                let videoModel = TitlePreviewViewModel(title: titleName, youtubeVideo: video, titleOverView: item.overview ?? "Unknown")
                self.delegate?.collectionViewTableViewCellDidTapCell(self, viewModel: videoModel)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
        
    }
}
