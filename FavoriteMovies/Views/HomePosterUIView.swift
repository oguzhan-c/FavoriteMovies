//
//  HomePosterUIView.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 15.10.2022.
//

import UIKit

class HomePosterUIView: UIView {

    
    private let playButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let posterImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "cyberpunk")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImageView)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
