 
import UIKit
import ObjectMapper
import SwiftyJSON

class UserServices : NSObject {

    func TopDealsData(callback: @escaping (Bool, DealsResModel?, String?,Bool)->Void)
    {
        Service.getRequest(.TopParam,callback:{(response, isinternet)in
            let json = JSON(response.deals!)
            callback(true, Mapper<DealsResModel>().map(JSONObject: json.object),"Success",isinternet)
        })
    }
    
    func PopularDealsData(callback: @escaping (Bool, DealsResModel?, String?,Bool)->Void)
    {
        Service.getRequest(.PopularParam,callback:{(response, isinternet)in
            let json = JSON(response.deals!)
            callback(true, Mapper<DealsResModel>().map(JSONObject: json.object),"Success",isinternet)
        })
    }
 }
