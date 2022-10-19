//
//  HomePosterUIView.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 15.10.2022.
//

import UIKit

class HomePosterUIView: UIView {
//    private let playButton : UIButton = {
//       let button = UIButton()
//        button.setTitle("Play", for: .normal)
//        button.layer.borderColor = UIColor.systemGreen.cgColor
//        button.layer.borderWidth = 3
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 10
//        return button
//    }()
    
//    private let downloadButton : UIButton = {
//        let button = UIButton()
//        button.setTitle("Download", for: .normal)
//        button.layer.borderColor = UIColor.systemGreen.cgColor
//        button.layer.borderWidth = 3
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 10
//        return button
//    }()
    
    private let posterImageViews : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "cyberpunk")
        return imageView
    }()
    
//    private func addGradient(){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor.clear.cgColor,
//            UIColor.systemBackground.cgColor,
//        ]
//        gradientLayer.frame = bounds
//        layer.addSublayer(gradientLayer)
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(posterImageViews)
//        addGradient()
//        addSubview(playButton)
//        addSubview(downloadButton)
//        applyConstraints()
    }
    
//    private func applyConstraints(){
//        let playButtonConsatraint = [
//            playButton.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 90),
//            playButton.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -40),
//            playButton.widthAnchor.constraint(equalToConstant: 120 )
//        ]
//
//        let downloadButtonConstraint = [
//            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -90 ),
//            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),
//            downloadButton.widthAnchor.constraint(equalToConstant: 120)
//        ]
//
//        NSLayoutConstraint.activate(playButtonConsatraint)
//        NSLayoutConstraint.activate(downloadButtonConstraint)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageViews.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
