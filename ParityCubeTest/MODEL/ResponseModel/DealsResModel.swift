//
//  EventsListResModel.swift
//  FAI Annual Seminar
//
//  Created by IKSL_IT on 01/08/17.
//  Copyright © 2017 IKSL_IT. All rights reserved.
//

import UIKit;
import ObjectMapper;

class DealsResModel: NSObject, Mappable {
    
    var total_count:Int?
    var data = [DealsDataResModel]()
    
    override init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        total_count <- map["total_count"]
        data <- map["data"]
    }
}
