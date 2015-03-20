//
//  randomImages.swift
//  LemonadeStand
//
//  Created by terry atkins on 20/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation
import UIKit

struct randomImages {
    let images:[String] = ["cold", "mild", "warm"]
    var image = UIImage(named: "")

    
    func randomImage() -> String {
    let imageRandom = Int(arc4random_uniform(UInt32(3)))
    let randomImage = self.images[imageRandom]
        
        return randomImage
    }
    
}