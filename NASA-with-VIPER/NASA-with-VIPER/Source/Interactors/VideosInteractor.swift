//
//  VideosInteractor.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 02/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol VideosInteractorInputProtocol: class {
    // Input functions from presenter to interactor
    // Funciones de entrada que van del presenter al interactor
    
    var presenter: VideosInteractorOutputProtocol? { get set}
    var videoRepository: VideosRepositoryInputProtocol? { get set}    
}

protocol VideosInteractorOutputProtocol: class {
    // Output functions from interactor to presenter
    // Funciones de salida que van del interactor al presenter
}

// MARK: - Class

class VideosInteractor: VideosInteractorInputProtocol {
    weak var presenter: VideosInteractorOutputProtocol?
    var videoRepository: VideosRepositoryInputProtocol?
    
    // Implementations for input functions from presenter to interactor
    // Implementación de las funciones de entrada que van desde el presenter al interactor
}

extension VideosInteractor: VideosRepositoryOutputProtocol {
    // Implementations for output functions from repository to interactor
    // Implementación de las funciones de salida que van desde el repositorio al interactor
}
