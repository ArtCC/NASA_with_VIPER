//
//  ListWireFrame.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ListWireFrameInputProtocol: class {
    // Input functions from presenter to wireframe

    static func createListModule() -> UIViewController
    
    func openDetailImage(from view: ListViewControllerInputProtocol, image: NASAImage)
}

// MARK: - Class

class ListWireFrame: ListWireFrameInputProtocol {
    // Implementations for input functions from presenter to wireframe

    class func createListModule() -> UIViewController {
        let navController = Utils.mainStoryboard.instantiateViewController(withIdentifier: "NavigationListViewController")
        
        if let view = navController.children.first as? ListViewController {
            
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
    
    func openDetailImage(from view: ListViewControllerInputProtocol, image: NASAImage) {
        let detailViewController = DetailWireFrame.createDetailModule(withImage: image)
        
        if let sourceView = view as? UIViewController {
            
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
