//
//  DetailViewController.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 01/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol DetailViewControllerInputProtocol: class {
    var presenter: DetailPresenterInputProtocol? { get set }
    
    // Input functions from presenter to view
    // Funciones de entrada que van desde el presenter a la vista
    
    func showData(imageData: NASAImage)
    func showImage(image: UIImage)
    func hiddenActivityIndicatorInImage(hidden: Bool)
}

// MARK: - Class

class DetailViewController: UIViewController {
    // MARK: - Properties
    
    var presenter: DetailPresenterInputProtocol?
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var NASAImageView: UIImageView!
    @IBOutlet weak var titleImage: UILabel!
    @IBOutlet weak var descriptionImage: UILabel!
    @IBOutlet weak var dateImage: UILabel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailViewControllerInputProtocol {
    // Implementations for input functions from presenter to view
    // Implementación de las funciones de entrada que van desde el presenter a la vista
    
    func showData(imageData: NASAImage) {
        
        if let d = imageData.dataCollection,
            let df = d.first {
            
            if let t = df.title,
                let dc = df.dateCreated {
                
                self.titleImage.text = t
                self.dateImage.text = dc
            } else {
                
                self.titleImage.isHidden = true
                self.dateImage.isHidden = true
            }
            
            if let di = df.description508 {
                
                self.descriptionImage.text = di
            } else {
                
                self.descriptionImage.isHidden = true
            }
        }
    }
    
    func showImage(image: UIImage) {
        self.NASAImageView.image = image
    }
    
    func hiddenActivityIndicatorInImage(hidden: Bool) {
        hidden ? self.activityIndicatorView.stopAnimating() : self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.isHidden = hidden
    }
}
