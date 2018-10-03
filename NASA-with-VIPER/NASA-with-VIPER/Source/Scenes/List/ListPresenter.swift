//
//  ListPresenter.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ListPresenterInputProtocol: class {
    var view: ListViewControllerInputProtocol? { get set }
    var imagesInteractor: ImagesInteractorInputProtocol? { get set }
    var videosInteractor: VideosInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameInputProtocol? { get set }
    var generalWireFrame: GeneralWireFrameInputProtocol? { get set }

    // Input functions from view to presenter
    // Funciones de entrada que van desde la vista al presenter
    
    func viewDidLoad()
    func userSelectedOption(image: NASAImage)
    func showHelpModule()
}

// MARK: - Class

class ListPresenter: ListPresenterInputProtocol {
    weak var view: ListViewControllerInputProtocol?
    var imagesInteractor: ImagesInteractorInputProtocol?
    var videosInteractor: VideosInteractorInputProtocol?
    var wireFrame: ListWireFrameInputProtocol?
    var generalWireFrame: GeneralWireFrameInputProtocol?
    
    // Implementations for input functions from view to presenter
    // Implementación de las funciones de entrada que van desde la vista hasta el presenter
    
    func viewDidLoad() {
        self.imagesInteractor?.findImagesList()
    }
    
    func userSelectedOption(image: NASAImage) {
        
        if let v = self.view {

            self.wireFrame?.openDetailImage(from: v, image: image)
        }
    }
    
    func showHelpModule() {
        
        if let v = self.view {
            
            self.wireFrame?.openHelp(from: v)
        }
    }
}

extension ListPresenter: ImagesInteractorOutputProtocol, VideosInteractorOutputProtocol {
    // Implementations for output functions from interactor to presenter
    // Implementación de las funciones de salida que van desde el interactor hasta el presenter

    func foundImagesList(images: [NASAImage]) {
        self.view?.hiddenActivityIndicatorAndShowTableView()
        self.view?.showImages(NASADataImages: images)
    }
    
    func onError() {
        debugPrint("ListPresenter:onError")
    }
}
