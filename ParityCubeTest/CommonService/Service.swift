import UIKit
import ObjectMapper
import Alamofire

public enum MethodName: String{
    // Start api
    case TopParam                  = "top.json"
    case PopularParam              = "popular.json"
    case NoParam                   = ""
  
}
class Service: NSObject {
    //Development Url
    fileprivate static let appLinkUrl = "https://api.desidime.com/v3/deals/";
    fileprivate static func setHeader() -> [String : String] {
        let dictionary = [
//            "Content-Type": "application/x-www-form-urlencoded",
//            "Accept": "application/json",
           "Content-Type": "application/json",
            "X-Desidime-Client": "7d7c5cacb355d043f07c7c9e4b38257ea5683f8d643b578683877a9b6a8bee1b"
        ];
        return dictionary;
    }
    
//    static func getRequest(_ method: MethodName, otherParam:[String : AnyObject], callback: @escaping (RequestOutcome, Bool) -> Void) {
//        let endPoint = appLinkUrl + method.rawValue ;
//
//        if CommonFunction.sharedInstance.isConnectedToNetwork(){
//           request(endPoint, method: .get, parameters: otherParam, encoding: URLEncoding.queryString, headers: setHeader())
//                .responseJSON { (response) in
//                    switch (response.result) {
//                    case .success:
//                        print(response.result)
//                        requestCallBack(response.result, callback: callback);
//                        break
//                    case .failure(let error):
//
//                        callback(RequestOutcome(),false)
//                        print("\n\nAuth request failed with error:\n \(error)")
//                        break
//                    }
//            }
//        }else{
//            callback(RequestOutcome(),false)
//        }
//    }
    
    static func getRequest(_ method: MethodName, callback: @escaping (RequestOutcome,Bool) -> Void) {
        let endPoint = appLinkUrl + method.rawValue ;
        if CommonFunction.sharedInstance.isConnectedToNetwork() {
            request(endPoint, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: setHeader())
                .responseJSON { (response) in
                    switch (response.result) {
                    case .success:
                        print(response.result)
                        requestCallBack(response.result, callback: callback);
                        break
                    case .failure(let error):
                        
                        callback(RequestOutcome(),false)
                        print("\n\nAuth request failed with error:\n \(error)")
                        break
                    }
            }
        }else{
            callback(RequestOutcome(),false)
        }
        
    }
    

//    static func postRequest(_ method: MethodName, params: [String : AnyObject], callback: @escaping (RequestOutcome,Bool) -> Void) {
//        let endPoint = appLinkUrl + method.rawValue;
//
//        if CommonFunction.sharedInstance.isConnectedToNetwork(){
//            request(endPoint, method: .post, parameters: params, encoding: JSONEncoding.default, headers: setHeader())
//                .responseJSON { (response) in
//                    switch (response.result) {
//                    case .success:
//                        print(response.result)
//                        requestCallBack(response.result, callback: callback);
//                        break
//                    case .failure(let error):
//
//                        callback(RequestOutcome(),false)
//                        print("\n\nAuth request failed with error:\n \(error)")
//                        break
//                    }
//            }
//        }else{
//            callback(RequestOutcome(),false)
//        }
//    }

/////////////////////////////////For PRODUCT DETAIL/////////////////////////////////////////
    fileprivate static func requestCallBack(_ result: Result<Any>, callback: (RequestOutcome, Bool) -> Void)  {
        if(result.isSuccess) {
                print(result.value as Any)
                let requestOutcome = Mapper<RequestOutcome>().map(JSONObject: result.value)
                callback(requestOutcome!,true);
           
        } else {
            callback(RequestOutcome(),true);
        }
    }
}
