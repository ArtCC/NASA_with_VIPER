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

// MARK: - PROTOCOLS

protocol DataRepositoryInputProtocol: class {
    var dataRequestHandler: DataRepositoryOutputProtocol? { get set }
    
    // Input functions from interactor to repository
    
    func getImagesList()
}

protocol DataRepositoryOutputProtocol: class {
    // Output functions from repository to interactor
    
    func onError()
}

// MARK: - CLASS

class DataRepository: DataRepositoryInputProtocol {
    var dataRequestHandler: DataRepositoryOutputProtocol?
    
    // Implementations for input functions from interactor to repository
    
    func getImagesList() {
    }
}
