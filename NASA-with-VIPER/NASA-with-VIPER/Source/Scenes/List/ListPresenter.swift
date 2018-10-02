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
    // Input functions from view to presenter

    var view: ListViewControllerInputProtocol? { get set }
    var imagesInteractor: ImagesInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameInputProtocol? { get set }
    
    func viewDidLoad()
    
    func userSelectedOption(image: NASAImage)
}

// MARK: - Class

class ListPresenter: ListPresenterInputProtocol {
    weak var view: ListViewControllerInputProtocol?
    var imagesInteractor: ImagesInteractorInputProtocol?
    var wireFrame: ListWireFrameInputProtocol?
    
    func viewDidLoad() {
        self.imagesInteractor?.findImagesList()
    }
    
    func userSelectedOption(image: NASAImage) {
        
        if let v = self.view {

            self.wireFrame?.openDetailImage(from: v, image: image)
        }
    }
}

extension ListPresenter: ImagesInteractorOutputProtocol {
    // Implementations for input functions from interactor to presenter

    func foundImagesList(images: [NASAImage]) {
        self.view?.showImages(NASADataImages: images)
    }
    
    func onError() {
        debugPrint("ListPresenter:onError")
    }
}
