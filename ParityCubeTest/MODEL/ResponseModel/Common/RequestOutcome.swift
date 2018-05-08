
//  Copyright (c) 2015 Dotsquares. All rights reserved.
//

import UIKit;
import ObjectMapper;

class RequestOutcome: NSObject, Mappable {
    
    var seo_setting: String?;
    var deals: AnyObject?;

    
    override init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        seo_setting <- map["seo_setting"];
        deals <- map["deals"];
    }
}


