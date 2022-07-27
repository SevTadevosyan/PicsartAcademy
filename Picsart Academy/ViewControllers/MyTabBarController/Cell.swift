//
//  Cell.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 28.06.22.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellNameLabel: UILabel!
    
    
    func configure(with image: UIImage, and name: String) {
        self.cellImageView.image = image
        cellImageView.tintColor = UIColor(named: "Pink")
        cellNameLabel.adjustsFontSizeToFitWidth = true
        self.cellNameLabel.text = name
    }
}
