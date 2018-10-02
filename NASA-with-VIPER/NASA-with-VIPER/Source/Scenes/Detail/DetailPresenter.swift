//
//  DetailPresenter.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol DetailPresenterInputProtocol: class {
    var view: DetailViewControllerInputProtocol? { get set }
    var wireFrame: DetailWireFrameInputProtocol? { get set }
    var NASAImage: NASAImage? { get set }

    // Input functions from view to presenter
    // Funciones de entrada que van desde la vista al presenter
    
    func viewDidLoad()
}

// MARK: - Class

class DetailPresenter: DetailPresenterInputProtocol {
    weak var view: DetailViewControllerInputProtocol?
    var wireFrame: DetailWireFrameInputProtocol?
    var NASAImage: NASAImage?
    
    // Implementations for input functions from view to presenter
    // Implementación de las funciones de entrada que van desde la vista hasta el presenter
    
    func viewDidLoad() {
        
        if let ni = self.NASAImage {
            
            self.view?.hiddenActivityIndicatorInImage(hidden: false)

            self.view?.showData(imageData: ni)
            
            if let l = ni.links,
                let h = l.first?.href {
                
                APIUtils.getImageWithURL(imageURLString: h) { (image) in
                    
                    self.view?.hiddenActivityIndicatorInImage(hidden: true)
                    
                    if let i = image {
                        
                        self.view?.showImage(image: i)
                    } else {
                        
                        self.view?.showImage(image: UIImage(named: "vehicle")!)
                    }
                }
            }
        }
    }
}
