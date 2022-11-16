//
//  TitleTableViewCell.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 27.10.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    required init?(coder: NSCoder) {
        fatalError()
    }
   

    private let titlePosterUIImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    public let titleButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle" , withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
        button.setImage( image , for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemPink
//        print("button pressed : Search")
        return button
    }()
    
    private func applyConstraints(){
        let titlesPosterUIImageViewConstaints = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor) ,
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 90),
            titlePosterUIImageView.heightAnchor.constraint(equalToConstant: 100)
            
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor) ,
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let titleButtonConstraints = [
            titleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor) ,
            titleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstaints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(titleButtonConstraints)
    }
    
    public func configure(with model : TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)")
        else {
            return
        }
        
        titlePosterUIImageView.sd_setImage(with: url , completed : nil)
        titleLabel.text = model.titleName
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleButton)
        
        applyConstraints()
    }
    
    
    
    
    
}

