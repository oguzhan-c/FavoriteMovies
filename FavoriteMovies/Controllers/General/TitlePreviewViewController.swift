//
//  TitlePreViewViewModel.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 27.10.2022.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(comment)
        view.addSubview(commentButton)
        configureConstraints()
        
        
        
    }
    
    private let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
       
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid!"
        return label
    }()
        
    private let comment: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 18 , weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .label
        return textField
    }()
    
    private let commentButton: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()


    
    func configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let commentConstraints = [
            comment.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor , constant: 30) ,
            comment.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 30) ,
            comment.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let commentButtonConstraints = [
            commentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commentButton.topAnchor.constraint(equalTo: comment.bottomAnchor, constant: 25),
            commentButton.widthAnchor.constraint(equalToConstant: 140),
            commentButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(commentConstraints)
        NSLayoutConstraint.activate(commentButtonConstraints)
        
    }
    
    
    public func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverView
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeVideo.id.videoId)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }

}


