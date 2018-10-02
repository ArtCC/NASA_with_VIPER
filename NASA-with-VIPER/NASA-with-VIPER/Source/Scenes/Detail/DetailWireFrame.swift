//
//  DetailWireFrame.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol DetailWireFrameInputProtocol: class {
    // Input functions from presenter to wireframe
    // Funciones de entrada que van desde el presenter al wireframe

    static func createDetailModule(withImage image: NASAImage) -> UIViewController
}

// MARK: - Class

class DetailWireFrame: DetailWireFrameInputProtocol {
    // Implementations for input functions from presenter to wireframe
    // Implementación de las funciones de entrada que van desde el presenter al wireframe

    class func createDetailModule(withImage image: NASAImage) -> UIViewController {
        let viewController = Utils.mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController")
        
        if let view = viewController as? DetailViewController {
            
            let presenter: DetailPresenterInputProtocol = DetailPresenter()
            let wireFrame: DetailWireFrameInputProtocol = DetailWireFrame()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.NASAImage = image
            
            return view
        }
        
        return UIViewController()
    }
}
