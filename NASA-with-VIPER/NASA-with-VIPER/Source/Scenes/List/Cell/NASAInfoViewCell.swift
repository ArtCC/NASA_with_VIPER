//
//  NASAInfoViewCell.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 02/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

class NASAInfoViewCell: UITableViewCell {
    // MARK: - Properties
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageDate: UILabel!
    
    var dataImage: NASAImage?
    
    // MARK: - Create cell
    
    static func createCell(tableView: UITableView) -> NASAInfoViewCell {
        let cellIdentifier = "NASAInfoViewCellIdentifier"
        
        guard let cell = Bundle.main.loadNibNamed("NASAInfoViewCell", owner: self, options: nil)?[0] as? NASAInfoViewCell else {
                
                return NASAInfoViewCell()
        }
        
        tableView.register(UINib(nibName: "NASAInfoViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        return cell
    }
    
    // MARK: - View life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Config
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(image: NASAImage) {
        self.dataImage = image
        
        self.activityIndicatorView.startAnimating()
        
        if let d = image.dataCollection,
            let df = d.first {
            
            if let t = df.title,
                let dc = df.dateCreated {
                
                self.title.text = t
                self.imageDate.text = dc
            }
        }
    }
}
