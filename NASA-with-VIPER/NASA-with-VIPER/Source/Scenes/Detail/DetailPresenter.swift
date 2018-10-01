//
//  DetailPresenter.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - PROTOCOLS

protocol DetailPresenterInputProtocol: class {
    // Input functions from view to presenter
    
    var view: DetailViewControllerInputProtocol? { get set }
    var wireFrame: DetailWireFrameInputProtocol? { get set }
    var NASAImage: NASAImage? { get set }

    func viewDidLoad()
}

// MARK: - CLASS

class DetailPresenter: DetailPresenterInputProtocol {
    weak var view: DetailViewControllerInputProtocol?
    var wireFrame: DetailWireFrameInputProtocol?
    var NASAImage: NASAImage?
    
    func viewDidLoad() {
    }
}
