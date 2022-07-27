//
//  UserCell.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 26.06.22.
//

import UIKit

class UserCell: UICollectionViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userPositionLabel: UILabel!
    
    
    func configure(with user: User) {
        userImage.image = UIImage(named: user.image) 
        usernameLabel.text = user.name
        userPositionLabel.text = user.position
    }
}
