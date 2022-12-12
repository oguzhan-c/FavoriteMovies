//
//  RegisterTableViewCell.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 12.12.2022.
//

import UIKit

// used for register 
class RegisterTableViewCell: UITableViewCell {
    static let identifier = "RegisterTableViewCell"

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private let infoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private func applyConstraints(){
        let infoLabelConstraints = [
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(infoLabelConstraints
        )

        
    }
    
    public func configure(with model : String){
        infoLabel.text = model.uppercased()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(infoLabel)
        
        contentView.backgroundColor = .systemPink
        
        applyConstraints()
    }

}
