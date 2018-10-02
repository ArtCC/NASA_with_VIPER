//
//  VideosRepository.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 02/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

// MARK: - Protocols

protocol VideosRepositoryInputProtocol: class {
    var videosRequestHandler: VideosRepositoryOutputProtocol? { get set }
    
    // Input functions from interactor to repository
    // Funciones de entrada que van desde el interactor al repositorio
}

protocol VideosRepositoryOutputProtocol: class {
    // Output functions from repository to interactor
    // Funciones de salida que van desde el repositorio al interactor
}

// MARK: - Class

class VideosRepository: VideosRepositoryInputProtocol {
    var videosRequestHandler: VideosRepositoryOutputProtocol?
    
    // Implementations for input functions from interactor to repository
    // Implementación de las funciones de entrada que van desde el interactor al repositorio
}
