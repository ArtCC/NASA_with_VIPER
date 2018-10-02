//
//  ImagesInteractor.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ImagesInteractorInputProtocol: class {
    // Input functions from presenter to interactor
    // Funciones de entrada que van del presenter al interactor
    
    var presenter: ImagesInteractorOutputProtocol? { get set}
    var dataRepository: DataRepositoryInputProtocol? { get set}
    
    func findImagesList()
}

protocol ImagesInteractorOutputProtocol: class {
    // Output functions from interactor to presenter
    // Funciones de salida que van del interactor al presenter
    
    func foundImagesList(images: [NASAImage])
    func onError()
}

// MARK: - Class

class ImagesInteractor: ImagesInteractorInputProtocol {
    weak var presenter: ImagesInteractorOutputProtocol?
    var dataRepository: DataRepositoryInputProtocol?
    
    // Implementations for input functions from presenter to interactor
    // Implementación de las funciones de entrada que van desde el presenter al interactor
    
    func findImagesList() {
        self.dataRepository?.getImagesListRequest()
    }
}

extension ImagesInteractor: DataRepositoryOutputProtocol {
    // Implementations for output functions from repository to interactor
    // Implementación de las funciones de salida que van desde el repositorio al interactor
    
    func foundImagesList(images: [NASAImage]) {
        self.presenter?.foundImagesList(images: images)
    }
    
    func onError() {
        self.presenter?.onError()
    }
}
