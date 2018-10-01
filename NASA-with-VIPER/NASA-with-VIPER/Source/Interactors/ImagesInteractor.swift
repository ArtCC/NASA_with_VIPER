//
//  ImagesInteractor.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

protocol ImagesInteractorInputProtocol: class {
    var presenter: ImagesInteractorOutputProtocol? { get set}
    var dataRepository: DataRepositoryInputProtocol? { get set}
}

protocol ImagesInteractorOutputProtocol: class {
    func onError()
}

class ImagesInteractor: ImagesInteractorInputProtocol {
    weak var presenter: ImagesInteractorOutputProtocol?
    var dataRepository: DataRepositoryInputProtocol?    
}

extension ImagesInteractor: DataRepositoryOutputProtocol {
    func onError() {
    }
}
