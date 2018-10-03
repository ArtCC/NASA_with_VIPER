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
    // Funciones de entrada que van desde el presenter al wireframe

    static func createModule() -> UIViewController
    
    func openDetailImage(from view: ListViewControllerInputProtocol, image: NASAImage)
    func openHelp(from view: ListViewControllerInputProtocol)
}

// MARK: - Class

class ListWireFrame: ListWireFrameInputProtocol {
    // Implementations for input functions from presenter to wireframe
    // Implementación de las funciones de entrada que van desde el presenter al wireframe

    class func createModule() -> UIViewController {
        let navController = Utils.mainStoryboard.instantiateViewController(withIdentifier: "NavigationListViewController")
        
        if let view = navController.children.first as? ListViewController {
            
            /**
             * In this module two interactors are implemented because it could have two or more different use cases.
               You can implement as many interactors with your use cases as necessary.
             * En este módulo se implementan dos interactors porque podría tener dos o más casos de uso diferentes.
               Se pueden implementar tantos interactors con sus casos de uso como sea necesario.
             */
            
            let presenter: ListPresenterInputProtocol & ImagesInteractorOutputProtocol & VideosInteractorOutputProtocol = ListPresenter()
            let imagesInteractor: ImagesInteractorInputProtocol & ImagesRepositoryOutputProtocol = ImagesInteractor()
            let videosInteractor: VideosInteractorInputProtocol & VideosRepositoryOutputProtocol = VideosInteractor()
            let imagesRepository: ImagesRepositoryInputProtocol = ImagesRepository()
            let videosRepository: VideosRepositoryInputProtocol = VideosRepository()
            let wireFrame: ListWireFrameInputProtocol = ListWireFrame()
            let generalWireFrame: GeneralWireFrameInputProtocol = GeneralWireFrame()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.generalWireFrame = generalWireFrame
            presenter.imagesInteractor = imagesInteractor
            presenter.videosInteractor = videosInteractor
            
            imagesInteractor.presenter = presenter
            imagesInteractor.imagesRepository = imagesRepository
            videosInteractor.videoRepository = videosRepository
            
            imagesRepository.imagesRequestHandler = imagesInteractor
            videosRepository.videosRequestHandler = videosInteractor
            
            return navController
        }
        
        return UIViewController()
    }
    
    func openDetailImage(from view: ListViewControllerInputProtocol, image: NASAImage) {
        let detailViewController = DetailWireFrame.createModule(withImage: image)
        
        if let sourceView = view as? UIViewController {
            
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func openHelp(from view: ListViewControllerInputProtocol) {
        let helpViewController = GeneralWireFrame.createHelpModule()
        
        if let sourceView = view as? UIViewController {
            
            sourceView.present(helpViewController, animated: true, completion: nil)
        }
    }
}
