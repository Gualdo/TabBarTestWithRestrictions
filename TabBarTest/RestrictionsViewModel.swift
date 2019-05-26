//
//  RestrictionsViewModel.swift
//  TabBarTest
//
//  Created by Eduardo David De La Cruz Marrero on 26/05/2019.
//  Copyright © 2019 eduardodelacruz. All rights reserved.
//

import Foundation

protocol RestrictionsOutput {
    
    func restrictionsDidChanged(isRestricted: Bool)
}

class RestrictionsViewModel {
    
    var output: RestrictionsOutput?
    
    init(withMainOutputController vC: RestrictionsOutput) {
        output = vC
    }
    
    func check(outputController: RestrictionsOutput) {
        
        output?.restrictionsDidChanged(isRestricted: true)
        outputController.restrictionsDidChanged(isRestricted: true)
    }
    
    func check() {
        
        output?.restrictionsDidChanged(isRestricted: true)
    }
}
