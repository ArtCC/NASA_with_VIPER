//
//  DetailWireFrame.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - PROTOCOLS

protocol DetailWireFrameInputProtocol: class {
    // Input functions from presenter to wireframe
    
    static func createDetailModule(withImage image: NASAImage) -> UIViewController
}

// MARK: - CLASS

class DetailWireFrame: DetailWireFrameInputProtocol {
    // Implementations for input functions from presenter to wireframe
    
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
