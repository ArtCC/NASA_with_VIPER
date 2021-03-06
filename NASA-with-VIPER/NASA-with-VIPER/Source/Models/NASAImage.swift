//
//  NASAImage.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import ObjectMapper

class NASAImage: Mappable {
    // MARK: - Properties
    
    var links: [Links]?
    var dataCollection: [DataInfo]?
    var href: String?
    
    // MARK: - Init
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    // MARK: - Mapping
    
    func mapping(map: Map) {
        links <- map["links"]
        dataCollection <- map["data"]
        href <- map["href"]
    }
}
