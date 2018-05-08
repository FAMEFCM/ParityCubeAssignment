//
//  ImageRoundCorner.swift
//  HungryTime
//
//  Created by admin on 02/08/16.
//  Copyright © 2016 Dotsquares. All rights reserved.
//

import UIKit

class ImageRoundCorner: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = self.bounds.size.height / 2.0
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
