//
//  TitleCollectionViewCell.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 19.10.2022.
//

import UIKit
import SDWebImage

//it's handeling insade section.exemple : poster of the movies.This is the spesific section handler.
class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    
    public func configure(with model : String){
     
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)")
        else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
