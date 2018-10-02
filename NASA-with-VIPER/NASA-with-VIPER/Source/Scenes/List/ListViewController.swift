//
//  ListViewController.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 13/9/18.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ListViewControllerInputProtocol: class {
    // Input functions from presenter to view

    var presenter: ListPresenterInputProtocol? { get set }
    
    func showImages(NASADataImages: [NASAImage])
}

// MARK: - Class

class ListViewController: UIViewController {
    // MARK: - Properties
    
    var presenter: ListPresenterInputProtocol?
    var NASADataImages: [NASAImage] = []
    
    let kHeightForCell: CGFloat = 100.0
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }
}

extension ListViewController: ListViewControllerInputProtocol {
    // Implementations for input functions from presenter to view
    
    func showImages(NASADataImages: [NASAImage]) {
        self.NASADataImages = NASADataImages
        self.tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.NASADataImages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.kHeightForCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NASAInfoViewCell = NASAInfoViewCell.createCell(tableView: tableView)
        cell.configCell(image: self.NASADataImages[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.userSelectedOption(image: self.NASADataImages[indexPath.row])
    }
}
