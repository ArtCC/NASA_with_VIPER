//
//  ImagesInteractor.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - PROTOCOLS

protocol ImagesInteractorInputProtocol: class {
    // Input functions from presenter to interactor

    var presenter: ImagesInteractorOutputProtocol? { get set}
    var dataRepository: DataRepositoryInputProtocol? { get set}
}

protocol ImagesInteractorOutputProtocol: class {
    // Output functions from interactor to presenter
    
    func onError()
}

// MARK: - CLASS

class ImagesInteractor: ImagesInteractorInputProtocol {
    weak var presenter: ImagesInteractorOutputProtocol?
    var dataRepository: DataRepositoryInputProtocol?
    
    // Implementations for input functions from presenter to interactor
}

extension ImagesInteractor: DataRepositoryOutputProtocol {
    // Implementations for output functions from repository to interactor
    
    func onError() {
    }
}
