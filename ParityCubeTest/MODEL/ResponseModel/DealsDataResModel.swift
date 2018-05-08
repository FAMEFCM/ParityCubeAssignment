//
//  NotiResModel.swift
//  FAI Annual Seminar
//
//  Created by IKSL_IT on 06/09/17.
//  Copyright © 2017 IKSL_IT. All rights reserved.
//

import UIKit;
import ObjectMapper;

class DealsDataResModel: NSObject, Mappable {
    var id:Int?
    var title:String?
    var fpd_flag:String?
    var off_percent:String?
    var current_price:Int?
    var original_price:Int?
    var image:String?
    var comments_count:Int?
    var all_posts_count:Int?
    var created_at:Int?
    var score:Int?
    var vote_value:Int?
    var state:String?
    var des:String?
    var share_url:String?
    var deal_url:String?
    
    var view_count:Int?
    var vote_down_reason:String?
    var vote_count:Int?
    var fpd_suggestted:Bool?
    var front_page_suggestions_count:Int?
    
    var merchant:MarchantResModel?
    var user:String?
    override init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"];
        fpd_flag <- map["fpd_flag"]
        off_percent <- map["off_percent"];
        current_price <- map["current_price"]
        original_price <- map["original_price"]
        image <- map["image"]
        comments_count <- map["comments_count"]
        
        user <- map["user"];
        merchant <- map["merchant"];
        front_page_suggestions_count <- map["front_page_suggestions_count"];
        fpd_suggestted <- map["fpd_suggestted"];
        vote_count <- map["vote_count"];
        vote_down_reason <- map["vote_down_reason"];
        view_count <- map["view_count"];
        deal_url <- map["deal_url"];
        share_url <- map["share_url"];
        des <- map["description"]
        state <- map["state"];
        vote_value <- map["vote_value"]
        score <- map["score"];
        created_at <- map["created_at"]
        all_posts_count <- map["all_posts_count"]
    }
}
