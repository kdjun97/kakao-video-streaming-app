//
//  HomeViewController.swift
//  KTV
//
//  Created by 김동준 on 2/25/24
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.register(
            UINib(nibName: "HomeVideoCell", bundle: nil),
            forCellReuseIdentifier: HomeVideoCell.identifier
        )
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        HomeSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .video:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .video:
            return tableView.dequeueReusableCell(withIdentifier: HomeVideoCell.identifier, for: indexPath)
        }
    }
}
