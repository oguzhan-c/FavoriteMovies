//
//  RegisterViewController.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 16.11.2022.
//

import UIKit

class RegisterViewController: UIViewController {

    public var registerInfos : [String] = [ "LastName" , "email" , "password" , "userName"]
    
    private let registertable : UITableView = {
        let table = UITableView()
        table.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        
        view.addSubview(registertable)
        registertable.delegate = self
        registertable.dataSource = self

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        registertable.frame = view.bounds
        registertable.backgroundColor = view.backgroundColor
    }
}

extension RegisterViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registerInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier) as? RegisterTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: registerInfos[indexPath.row])
        return cell
    }
    

    
}
