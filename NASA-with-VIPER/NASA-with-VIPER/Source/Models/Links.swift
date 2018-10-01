//
//  Links.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import ObjectMapper

class Links: Mappable {
    // MARK: - Properties
    
    var render: String?
    var rel: String?
    var href: String?
    
    // MARK: - Init
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    // MARK: - Mapping
    
    func mapping(map: Map) {
        render <- map["render"]
        rel <- map["rel"]
        href <- map["href"]
    }
}
