//
//  APIUtils.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 02/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class APIUtils: NSObject {
    /// Get image with url string from service
    ///
    /// - Parameter imageURLString: image url string
    /// - Returns: image if exist
    static func getImageWithURL(imageURLString: String,
                                callback:@escaping(_ image: UIImage?) -> Void) {
        Alamofire.request(imageURLString).responseImage { response in
            
            if let image = response.result.value {
                
                callback(image)
            } else {
                
                callback(nil)
            }
        }
    }
}
