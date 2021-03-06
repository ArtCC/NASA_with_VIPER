//
//  GeneralWireFrame.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 02/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol GeneralWireFrameInputProtocol: class {
    // Input functions from presenter to wireframe
    // Funciones de entrada que van desde el presenter al wireframe
    
    static func createHelpModule() -> UIViewController
}

// MARK: - Class

class GeneralWireFrame: GeneralWireFrameInputProtocol {
    // Implementations for input functions from presenter to wireframe
    // Implementación de las funciones de entrada que van desde el presenter al wireframe
    
    static func createHelpModule() -> UIViewController {
        let viewController = Utils.mainStoryboard.instantiateViewController(withIdentifier: "HelpViewController")
        
        if let view = viewController as? HelpViewController {
            
            let presenter: HelpPresenterInputProtocol = HelpPresenter()
            let wireFrame: HelpWireFrameInputProtocol = HelpWireFrame()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.wireFrame = wireFrame
            
            return view
        }
        
        return UIViewController()
    }
}

/**
 * General WireFrame that I use to implement in all modules that need a common wireframe. So I do not replicate that function in all scenes.
 * WireFrame general que yo uso para implementar en todas los módulos que necesitan un wireFrame común. Así no replico esa función en todas las escenas.
 */
