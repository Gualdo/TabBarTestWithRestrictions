//
//  FavoriteViewController.swift
//  TabBarTest
//
//  Created by Eduardo David De La Cruz Marrero on 26/05/2019.
//  Copyright © 2019 eduardodelacruz. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var isRestricted: Bool? {
        didSet {
            view.backgroundColor = .red
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFavoriteView()
    }
    
    func setupFavoriteView() {
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Favorite"
    }
}

extension FavoriteViewController: RestrictionsOutput {
    
    func restrictionsDidChanged(isRestricted: Bool) {
        self.isRestricted = isRestricted
    }
}
