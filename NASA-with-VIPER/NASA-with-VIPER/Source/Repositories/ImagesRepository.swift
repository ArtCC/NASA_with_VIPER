//
//  ImagesRepository.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

// MARK: - Protocols

protocol ImagesRepositoryInputProtocol: class {
    var imagesRequestHandler: ImagesRepositoryOutputProtocol? { get set }
    
    // Input functions from interactor to repository
    // Funciones de entrada que van desde el interactor al repositorio
    
    func getImagesListRequest()
}

protocol ImagesRepositoryOutputProtocol: class {
    // Output functions from repository to interactor
    // Funciones de salida que van desde el repositorio al interactor
    
    func foundImagesList(images: [NASAImage])
    func onError()
}

// MARK: - Class

class ImagesRepository: ImagesRepositoryInputProtocol {
    var imagesRequestHandler: ImagesRepositoryOutputProtocol?
    
    // Implementations for input functions from interactor to repository
    // Implementación de las funciones de entrada que van desde el interactor al repositorio
    
    func getImagesListRequest() {
        let urlParams = [
            "q" : "earth",
            "media_type" : "image"
        ]
        
        let urlString: String = APIConstants.urlBase + APIConstants.urlForSearch
        
        Alamofire.request(urlString, method: .get, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                if (response.result.error == nil) {
                    
                    guard let json: [String : Any] = response.result.value as? [String : Any],
                        let collection: [String : Any] = json["collection"] as? [String : Any],
                        let items: [[String : Any]] = collection["items"] as? [[String : Any]] else {
                            
                            if let drh = self.imagesRequestHandler {
                                
                                drh.onError()
                            }
                            
                            return
                    }
                    
                    var imagesFromNASA: [NASAImage] = []
                    
                    for item in items {
                        
                        if let image: NASAImage = NASAImage(JSON: item) {
                            
                            imagesFromNASA.append(image)
                        }
                    }
                    
                    self.imagesRequestHandler?.foundImagesList(images: imagesFromNASA)
                } else {
                    
                    self.imagesRequestHandler?.onError()
                }
        }
    }
}
