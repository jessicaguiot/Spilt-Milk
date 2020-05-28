//
//  HomeViewController.swift
//  Bookshelf
//
//  Created by Hiago Chagas on 12/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let posts = getPosts()
    
    @objc func AddPost(){
//        let targetViewController: AddPostViewController? = AddPostViewController()
//        let NavController = UINavigationController(rootViewController: targetViewController!)
//        self.present(NavController, animated: true)
        let targetViewController = AddPostViewController()
        navigationController?.pushViewController(targetViewController, animated: true)

    }
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
    }
    func setupBarButtonItem(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 153/255, green: 243/255, blue: 238/255, alpha: 1)
        self.navigationItem.title = "Home"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddPost))
    }
    override func loadView(){
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
        setupBarButtonItem()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        cell.post = posts[indexPath.row]
        return cell
    }
   
}

