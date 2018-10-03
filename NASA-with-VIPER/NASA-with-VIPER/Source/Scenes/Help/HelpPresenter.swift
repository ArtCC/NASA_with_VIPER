//
//  HelpPresenter.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 03/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol HelpPresenterInputProtocol: class {
    var view: HelpViewControllerInputProtocol? { get set }
    var wireFrame: HelpWireFrameInputProtocol? { get set }
    
    // Input functions from view to presenter
    // Funciones de entrada que van desde la vista al presenter
    
    func viewDidLoad()
    func userNeedCloseModule()
}

// MARK: - Class

class HelpPresenter: HelpPresenterInputProtocol {
    weak var view: HelpViewControllerInputProtocol?
    var wireFrame: HelpWireFrameInputProtocol?
    
    // Implementations for input functions from view to presenter
    // Implementación de las funciones de entrada que van desde la vista hasta el presenter
    
    func viewDidLoad() {
        
        if let u = URL(string: APIConstants.infoNASAURL) {
            
            self.view?.loadURL(url: u)
        }
    }
    
    func userNeedCloseModule() {
        
        if let v = self.view {

            self.wireFrame?.closeModule(view: v)
        }
    }
}
