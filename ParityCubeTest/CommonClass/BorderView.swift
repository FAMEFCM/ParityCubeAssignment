//
//  BorderView.swift
//  HungryTime
//  Created by admin on 01/08/16.
//  Copyright © 2016 Dotsquares. All rights reserved.
//

import UIKit

class BorderView: UIView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width:0.5,height: 4.0); //Here your control your spread
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 5.0 //Here your control your blur
        
    }

    
}
