//
//  DataRepository.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol DataRepositoryInputProtocol: class {
    var dataRequestHandler: DataRepositoryOutputProtocol? { get set }
    
    func getImagesList()
}

protocol DataRepositoryOutputProtocol: class {
    func onError()
}

class DataRepository: DataRepositoryInputProtocol {
    var dataRequestHandler: DataRepositoryOutputProtocol?
    
    func getImagesList() {
        
    }
}
