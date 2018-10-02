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
    
    func showHome()
}

// MARK: - Class

class GeneralWireFrame: GeneralWireFrameInputProtocol {
    // Implementations for input functions from presenter to wireframe
    // Implementación de las funciones de entrada que van desde el presenter al wireframe
    
    func showHome() {
    }
}

/**
 * General WireFrame that I use to implement in all modules that need a common wireframe. So I do not replicate that function in all scenes.
 * WireFrame general que yo uso para implementar en todas los módulos que necesitan un wireFrame común. Así no replico esa función en todas las escenas.
 */
