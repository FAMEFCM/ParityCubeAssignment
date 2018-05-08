//
//  ThemeTVCell.swift
//  FAI Annual Seminar
//
//  Created by IKSL_IT on 23/08/17.
//  Copyright © 2017 IKSL_IT. All rights reserved.
//

import UIKit

class DealsTVCell: UITableViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imgDeal: UIImageView!
    @IBOutlet var lblDetail: UILabel!
    @IBOutlet var lblChat: UILabel!
    @IBOutlet var lblShare: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblPriceType: UILabel!
    
    @IBOutlet var imgOfferWidth: NSLayoutConstraint!
    @IBOutlet var imgOfferHeight: NSLayoutConstraint!
    @IBOutlet var lblOffer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgDeal.layer.masksToBounds=true
        imgDeal.layer.borderWidth=1
        imgDeal.layer.borderColor = UIColor.lightGray.cgColor
        imgDeal.layer.cornerRadius=5
    }

}
