//
//  Model.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 26.06.22.
//

import UIKit

struct User {
    let image: String
    let name: String
    let position: String
    
    init(image: String, name: String, position: String) {
        self.image = image
        self.name = name
        self.position = position
    }
    
}

//enum MenuModel: Int, CustomStringConvertible {
//    
//    case Home
//    case Sandbox
//    case LevelUp
//    case CRL
//    case Tracks
//    case Staff
//    case Settings
//    
//    var description: String {
//        switch self {
//        case .Home: return "Picsart Academy"
//        case .Sandbox: return "Sandbox"
//        case .LevelUp: return "LevelUp Bootcamp"
//        case .CRL: return "Code Republic Lab"
//        case .Tracks: return "Career Tracks"
//        case .Staff: return "Staff"
//        case .Settings: return "Setting"
//            
//        }
//    }
//    
//    var image: UIImage {
//        switch self {
//        case .Home: return UIImage(named: "graduationcap.fill") ?? UIImage()
//        case .Sandbox: return UIImage(systemName: "atom") ?? UIImage()
//        case .LevelUp: return UIImage(systemName: "swift") ?? UIImage()
//        case .CRL: return UIImage(systemName: "arkit") ?? UIImage()
//        case .Tracks: return UIImage(systemName: "server.rack") ?? UIImage()
//        case .Staff: return UIImage(systemName: "person.3.fill") ?? UIImage()
//        case .Settings: return UIImage(named: "gear") ?? UIImage()
//        }
//    }
//    
//}
