//
//  HtmlPageResModel.swift
//  FAI Annual Seminar
//
//  Created by IKSL_IT on 30/08/17.
//  Copyright © 2017 IKSL_IT. All rights reserved.
//
import UIKit;
import ObjectMapper;

class MarchantResModel: NSObject, Mappable {
    var id:Int?
    var name:String?
    var image:String?
    var permalink:String?
    var recommendation:Int?
    var recommendation_flag:String?
   
    override init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        average_rating <- map["average_rating"];
        permalink <- map["permalink"];
        recommendation <- map["recommendation"];
        recommendation_flag <- map["recommendation_flag"];
        id <- map["id"];
        name <- map["name"];
        image <- map["image"];
    }
}

