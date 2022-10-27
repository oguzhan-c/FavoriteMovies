//
//  HomePosterUIView.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 15.10.2022.
//

import UIKit

class HomePosterUIView: UIView {
    
    private let posterImageViews : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "cyberpunk")
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(posterImageViews)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageViews.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
