//
//  VideoViewController.swift
//  TabBarTest
//
//  Created by Eduardo David De La Cruz Marrero on 26/05/2019.
//  Copyright © 2019 eduardodelacruz. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    var isRestricted: Bool? {
        didSet {
            view.backgroundColor = .blue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoView()
    }
    
    func setupVideoView() {
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Videos"
    }
}

extension VideoViewController: RestrictionsOutput {
    
    func restrictionsDidChanged(isRestricted: Bool) {
        self.isRestricted = isRestricted
    }
}
