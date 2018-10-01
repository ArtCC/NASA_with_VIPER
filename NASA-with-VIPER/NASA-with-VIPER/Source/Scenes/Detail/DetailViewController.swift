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
    // Input functions from presenter to view
    
    var presenter: DetailPresenterInputProtocol? { get set }
}

// MARK: - Class

class DetailViewController: UIViewController {
    // MARK: - Properties
    
    var presenter: DetailPresenterInputProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailViewControllerInputProtocol {
    // Implementations for input functions from presenter to view
}
