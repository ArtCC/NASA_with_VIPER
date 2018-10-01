//
//  ListViewController.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 13/9/18.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - PROTOCOLS

protocol ListViewControllerInputProtocol: class {
    // Input functions from presenter to view

    var presenter: ListPresenterInputProtocol? { get set }
}

// MARK: - CLASS

class ListViewController: UIViewController {
    // MARK: - Properties
    
    var presenter: ListPresenterInputProtocol?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
    }
}

extension ListViewController: ListViewControllerInputProtocol {
    // Implementations for input functions from presenter to view
}
