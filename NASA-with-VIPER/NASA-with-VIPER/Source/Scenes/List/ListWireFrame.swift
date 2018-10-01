//
//  ListWireFrame.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

protocol ListWireFrameInputProtocol: class {
    static func createListModule() -> UIViewController
}

class ListWireFrame: ListWireFrameInputProtocol {
    class func createListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationListViewController")
        
        if let view = navController.childViewControllers.first as? ListViewController {
            
            let presenter: ListPresenterInputProtocol & ImagesInteractorOutputProtocol = ListPresenter()
            let imagesInteractor: ImagesInteractorInputProtocol & DataRepositoryOutputProtocol = ImagesInteractor()
            let dataRepository: DataRepositoryInputProtocol = DataRepository()
            let wireFrame: ListWireFrameInputProtocol = ListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.imagesInteractor = imagesInteractor
            imagesInteractor.presenter = presenter
            imagesInteractor.dataRepository = dataRepository
            dataRepository.dataRequestHandler = imagesInteractor
            
            return navController
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
