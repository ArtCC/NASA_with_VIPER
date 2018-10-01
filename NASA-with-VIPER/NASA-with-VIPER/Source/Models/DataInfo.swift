//
//  DataInfo.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import ObjectMapper

class DataInfo: Mappable {
    // MARK: - Properties
    
    var descriptionString: String?
    var title: String?
    var dateCreated: String?
    var keywords: [String]?
    var secondaryCreator: String?
    var NASAID: String?
    var mediaType: String?
    var description508: String?
    var center: String?
    
    // MARK: - Init
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    // MARK: - Mapping
    
    func mapping(map: Map) {
        descriptionString <- map["description"]
        title <- map["title"]
        dateCreated <- map["date_created"]
        keywords <- map["keywords"]
        secondaryCreator <- map["secondary_creator"]
        NASAID <- map["nasa_id"]
        mediaType <- map["media_type"]
        description508 <- map["description_508"]
        center <- map["center"]
    }
}
