//
//  HelpWireFrame.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 03/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol HelpWireFrameInputProtocol: class {
    // Input functions from presenter to wireframe
    // Funciones de entrada que van desde el presenter al wireframe
    
    static func createModule() -> UIViewController
    
    func closeModule(view: HelpViewControllerInputProtocol)
}

// MARK: - Class

class HelpWireFrame: HelpWireFrameInputProtocol {
    // Implementations for input functions from presenter to wireframe
    // Implementación de las funciones de entrada que van desde el presenter al wireframe
    
    class func createModule() -> UIViewController {
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
    
    func closeModule(view: HelpViewControllerInputProtocol) {
        
        if let vc = view as? UIViewController {
            
            if let nc = vc.navigationController {
                
                nc.dismiss(animated: true, completion: nil)
            } else {
             
                vc.dismiss(animated: true, completion: nil)
            }
        }
    }
}
